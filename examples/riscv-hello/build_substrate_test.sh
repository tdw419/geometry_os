#!/bin/bash
# Build the Substrate Driver test kernel.
set -e
cd "$(dirname "$0")"

CC=riscv64-linux-gnu-gcc
OBJCOPY=riscv64-linux-gnu-objcopy
AR=riscv64-linux-gnu-ar
CFLAGS="-ffreestanding -nostdlib -nostartfiles -fno-pic -march=rv32imac_zicsr -mabi=ilp32 -O2 -static -no-pie -mcmodel=medany"

SLOT_A=0x80010000
SLOT_B=0x80050000
STACK_A=0x80100000
STACK_B=0x80110000
KERN_ADDR=0x80000000

echo "=== Building Substrate Test Kernel ==="

# 1. Build libgeos.a
$CC $CFLAGS -c libgeos.c -o libgeos.o
$AR rcs libgeos.a libgeos.o
rm -f libgeos.o

# 2. Build substrate_test.elf at SLOT_A
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$SLOT_A -Wl,--defsym,STACK_TOP=$STACK_A \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o guest_a.elf guest_crt0.S substrate_test.c -L. -lgeos
$OBJCOPY -O binary guest_a.elf guest_a.bin

# 3. Build life32.elf at SLOT_B (as a secondary guest)
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$SLOT_B -Wl,--defsym,STACK_TOP=$STACK_B \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o guest_b.elf guest_crt0.S life32.c -L. -lgeos
$OBJCOPY -O binary guest_b.elf guest_b.bin

# 4. Build the kernel
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$KERN_ADDR -Wl,--defsym,STACK_TOP=0x80120000 \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o substrate_kern.elf guest_crt0.S geos_kern.c kern_trap.S guest_images.S -L. -lgeos

echo "Built substrate_kern.elf"
