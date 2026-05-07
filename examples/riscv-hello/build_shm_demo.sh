#!/bin/bash
# Build the Phase 235 SHM demo kernel (geos_shm_demo.elf).
#
# Embeds two guest programs:
#   guest_a = shm_producer.c (left half, writes to shared memory)
#   guest_b = shm_consumer.c (right half, reads from shared memory)
#
# The producer allocates a shared memory slot and writes incrementing
# values into a ring buffer. The consumer reads those values and
# displays progress. Both show progress bars that fill simultaneously.
#
# Build: ./build_shm_demo.sh
# Run:   cargo run --example kern_verify -- examples/riscv-hello/geos_shm_demo.elf

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
KERN_STACK=0x80120000

echo "=== Phase 235: SHM Demo Kernel Build ==="

# 1. Build libgeos.a
echo "[1/6] Building libgeos.a..."
$CC $CFLAGS -c libgeos.c -o libgeos.o
$AR rcs libgeos.a libgeos.o
rm -f libgeos.o

# 2. Build libfb.a
echo "[2/6] Building libfb.a..."
$CC $CFLAGS -c libfb.c -o libfb.o
$AR rcs libfb.a libfb.o
rm -f libfb.o

# 3. Build guest_a.elf (shm_producer, left half)
echo "[3/6] Building guest_a (shm_producer)..."
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$SLOT_A -Wl,--defsym,STACK_TOP=$STACK_A \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o shm_producer.elf guest_crt0.S shm_producer.c -L. -lgeos -lfb
$OBJCOPY -O binary shm_producer.elf shm_producer.bin
echo "  shm_producer: $(wc -c < shm_producer.bin) bytes"

# 4. Build guest_b.elf (shm_consumer, right half)
echo "[4/6] Building guest_b (shm_consumer)..."
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$SLOT_B -Wl,--defsym,STACK_TOP=$STACK_B \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o shm_consumer.elf guest_crt0.S shm_consumer.c -L. -lgeos -lfb
$OBJCOPY -O binary shm_consumer.elf shm_consumer.bin
echo "  shm_consumer: $(wc -c < shm_consumer.bin) bytes"

# 5. Verify guest binaries exist
echo "[5/6] Verifying guest binaries..."
if [ ! -f shm_producer.bin ] || [ ! -f shm_consumer.bin ]; then
    echo "ERROR: guest binaries missing!"
    exit 1
fi

# 6. Build geos_shm_demo.elf
#    Note: uses guest_images.S which .incbin's shm_producer.bin + shm_consumer.bin
echo "[6/6] Building geos_shm_demo.elf..."
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$KERN_ADDR -Wl,--defsym,STACK_TOP=$KERN_STACK \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o geos_shm_demo.elf guest_crt0.S geos_kern.c kern_trap.S guest_images.S -L. -lgeos

SIZE=$(stat --format=%s geos_shm_demo.elf 2>/dev/null || echo "?")
echo ""
echo "=== Build complete ==="
echo "  geos_shm_demo.elf: ${SIZE} bytes"
echo "  guest_a = shm_producer (writes to SHM, left half)"
echo "  guest_b = shm_consumer (reads from SHM, right half)"
echo ""
echo "Test with: cargo run --example kern_verify -- examples/riscv-hello/geos_shm_demo.elf"
