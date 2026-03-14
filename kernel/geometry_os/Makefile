# Geometry OS Kernel Module Makefile
#
# Build: make
# Load:  sudo insmod geometry_os.ko
# Unload: sudo rmmod geometry_os

KDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

obj-m += geometry_os.o
geometry_os-objs := main.o

all: modules

modules:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

install: modules
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
	depmod -a

.PHONY: all modules clean install
