terraform {
  required_version = ">=0.13.0"
  backend "s3" {
    bucket         = "hubert-s3-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "aws-locks"
    encrypt        = true
  }
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 3.13.0"
}

module "bootstrap" {
  source               = "./modules/bootstrap"
  name_of_s3_bucket    = "hubert-s3-bucket"
  dynamo_db_table_name = "aws-locks"
}
