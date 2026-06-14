#!/bin/bash
# Build the XOR Neural Offload test kernel.
# Guest A: xor_neural_test (SLOT_A)
# Guest B: life32 (SLOT_B) -- secondary visual guest
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

echo "=== Building XOR Neural Offload Kernel ==="

# 1. Build libgeos.a
$CC $CFLAGS -c libgeos.c -o libgeos.o
$AR rcs libgeos.a libgeos.o
rm -f libgeos.o
echo "[1/4] libgeos.a"

# 2. Build xor_neural_test.elf at SLOT_A
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$SLOT_A -Wl,--defsym,STACK_TOP=$STACK_A \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o guest_a.elf guest_crt0.S xor_neural_test.c -L. -lgeos
$OBJCOPY -O binary guest_a.elf guest_a.bin
echo "[2/4] guest_a (xor_neural_test)"

# 3. Build life32.elf at SLOT_B
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$SLOT_B -Wl,--defsym,STACK_TOP=$STACK_B \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o guest_b.elf guest_crt0.S life32.c -L. -lgeos
$OBJCOPY -O binary guest_b.elf guest_b.bin
echo "[3/4] guest_b (life32)"

# 4. Build the kernel (embeds guest images via guest_images.S)
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$KERN_ADDR -Wl,--defsym,STACK_TOP=0x80120000 \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o xor_kern.elf guest_crt0.S geos_kern.c kern_trap.S guest_images.S -L. -lgeos
echo "[4/4] xor_kern.elf"

echo ""
echo "Built xor_kern.elf -- run with: cargo run --example riscv-hello -- xor_kern.elf"
