#!/bin/bash
# Build the Phase I kernel (geos_kern.elf) with two embedded guest programs.
#
# Split-screen capstone: painter_left (left half) + life32 (right half)
#
# Build order:
#   1. Rebuild libgeos.a (kernel + guests share it)
#   2. Build guest_a.elf (painter_left) at SLOT_A, guest_b.elf (life32) at SLOT_B
#   3. objcopy to raw .bin
#   4. Link kernel (geos_kern.c + kern_trap.S + guest_images.S) at 0x80000000

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

echo "=== Phase I kernel build (painter_left + life32) ==="

# 1. Build libgeos.a
echo "[1/5] Building libgeos.a..."
$CC $CFLAGS -c libgeos.c -o libgeos.o
$AR rcs libgeos.a libgeos.o
rm -f libgeos.o

# 2. Build guest_a.elf (animated painter, left half) at SLOT_A
echo "[2/5] Building guest_a (painter_left, left half)..."
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$SLOT_A -Wl,--defsym,STACK_TOP=$STACK_A \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o guest_a.elf guest_crt0.S painter_left.c -L. -lgeos
$OBJCOPY -O binary guest_a.elf guest_a.bin
echo "  guest_a (painter_left): $(wc -c < guest_a.bin) bytes"

# 3. Build guest_b.elf (life32, right half) at SLOT_B
echo "[3/5] Building guest_b (life32, right half)..."
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$SLOT_B -Wl,--defsym,STACK_TOP=$STACK_B \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o guest_b.elf guest_crt0.S life32.c -L. -lgeos
$OBJCOPY -O binary guest_b.elf guest_b.bin
echo "  guest_b (life32): $(wc -c < guest_b.bin) bytes"

# 4. Verify guest binaries exist
echo "[4/5] Verifying guest binaries..."
if [ ! -f guest_a.bin ] || [ ! -f guest_b.bin ]; then
    echo "ERROR: guest_a.bin or guest_b.bin missing!"
    exit 1
fi

# 5. Build geos_kern.elf (linked at kernel address)
echo "[5/5] Building geos_kern.elf..."
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$KERN_ADDR -Wl,--defsym,STACK_TOP=0x80120000 \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o geos_kern.elf guest_crt0.S geos_kern.c kern_trap.S guest_images.S -L. -lgeos

ENTRY=$($CC-readelf -h geos_kern.elf 2>/dev/null | grep 'Entry point' | awk '{print $NF}' || echo "?")
SIZE=$(stat --format=%s geos_kern.elf)
echo ""
echo "=== Build complete ==="
echo "  geos_kern.elf: entry=$ENTRY size=${SIZE} bytes"
echo "  guest_a = painter_left (animated, left half)"
echo "  guest_b = life32 (Game of Life, right half)"
echo ""
echo "Test with: cargo run --example kern_verify -- examples/riscv-hello/geos_kern.elf"
