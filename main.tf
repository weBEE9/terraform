# terraform setting
# Configure the Azure provider
# providers will be installed from terraform registry by default
terraform {
  required_providers {
    azurerm = {
      # azure resource manager
      # registry.terraform.io/hashicorp/azurerm
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

# Configure the specified provider
provider "azurerm" {
  features {}
}

# resource block defines the components of the infrastructure
# Resource blocks have two strings before the block: the resource type and the resource name

# type: 'azurerm_resource_group', name: 'rg'
# the prefix of the type maps the name of the provider
# ther type and name of the reosurce will form a unique id for the resource
# in this example which is azurerm_resource_group.rg
resource "azurerm_resource_group" "rg" {
  # arguments to configure the resource
  # see: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
  # for more azure provider options
  name     = "learn-terraform-resource-group"
  location = "southeastasia"
}

# terraform init
# terraform fmt, format the configuration.
# terraform validate, validate the configuration

/*
$ terraform apply

會先顯示執行計畫，如果有任何問題都可以在此時終止
在此範例中會 create 一個 resource group

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "southeastasia"
      + name     = "learn-terraform-resource-group"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: 
*/