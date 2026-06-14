#!/bin/bash
# Build the Phase 240 Clock Demo kernel (geos_clock_demo.elf).
#
# Demonstrates timer and sleep syscalls:
#   - geos_uptime() for reading elapsed boot time
#   - geos_alarm_set() for async blink callback
#   - geos_wait_ms() for frame-rate-controlled animation
#
# The demo shows an animated digital clock (HH:MM:SS) with blinking
# colons, a seconds progress bar, and a millisecond/tick counter.
#
# Build: ./build_clock_demo.sh
# Run:   cargo run --example kern_verify -- examples/riscv-hello/geos_clock_demo.elf

set -e
cd "$(dirname "$0")"

CC=riscv64-linux-gnu-gcc
OBJCOPY=riscv64-linux-gnu-objcopy
AR=riscv64-linux-gnu-ar
CFLAGS="-ffreestanding -nostdlib -nostartfiles -fno-pic -march=rv32imac_zicsr -mabi=ilp32 -O2 -static -no-pie -mcmodel=medany"

SLOT=0x80010000
STACK=0x80100000
KERN_ADDR=0x80000000
KERN_STACK=0x80120000

echo "=== Phase 240: Clock Demo Kernel Build ==="

# 1. Build libgeos.a
echo "[1/5] Building libgeos.a..."
$CC $CFLAGS -c libgeos.c -o libgeos.o
$AR rcs libgeos.a libgeos.o
rm -f libgeos.o

# 2. Build libfb.a
echo "[2/5] Building libfb.a..."
$CC $CFLAGS -c libfb.c -o libfb.o
$AR rcs libfb.a libfb.o
rm -f libfb.o

# 3. Build guest.elf (clock_demo)
echo "[3/5] Building guest (clock_demo)..."
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$SLOT -Wl,--defsym,STACK_TOP=$STACK \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o clock_demo.elf guest_crt0.S clock_demo.c -L. -lgeos -lfb
$OBJCOPY -O binary clock_demo.elf clock_demo.bin
echo "  clock_demo: $(wc -c < clock_demo.bin) bytes"

# 4. Create guest images for kernel linker
#    guest_images.S expects guest_a.bin and guest_b.bin
#    guest_a = clock_demo, guest_b = minimal idle guest
echo "[4/5] Creating guest images..."
if [ ! -f clock_demo.bin ]; then
    echo "ERROR: clock_demo.bin missing!"
    exit 1
fi
cp clock_demo.bin guest_a.bin

# Build minimal idle guest for slot B (just spins in a yield loop).
# NOTE: We do NOT link guest_crt0.S here because idle_guest.S defines
# its own _start. guest_crt0.S also defines _start (duplicate symbol).
cat > idle_guest.S << 'IDLE_EOF'
    .section .text
    .globl _start
_start:
    li a7, 0x47454F00   # GEOS SBI extension
    li a6, 0            # YIELD
    ecall
    j _start
IDLE_EOF
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=0x80050000 -Wl,--defsym,STACK_TOP=0x80110000 \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o idle_guest.elf idle_guest.S
$OBJCOPY -O binary idle_guest.elf guest_b.bin
echo "  idle_guest: $(wc -c < guest_b.bin) bytes"
rm -f idle_guest.S idle_guest.elf idle_guest.o

# 5. Build geos_clock_demo.elf
echo "[5/5] Building geos_clock_demo.elf..."
$CC $CFLAGS -Wl,--defsym,BASE_ADDR=$KERN_ADDR -Wl,--defsym,STACK_TOP=$KERN_STACK \
    -T guest.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
    -o geos_clock_demo.elf guest_crt0.S geos_kern.c kern_trap.S guest_images.S -L. -lgeos

SIZE=$(stat --format=%s geos_clock_demo.elf 2>/dev/null || echo "?")
echo ""
echo "=== Build complete ==="
echo "  geos_clock_demo.elf: ${SIZE} bytes"
echo "  guest = clock_demo (animated digital clock with timer syscalls)"
echo ""
echo "Test with: cargo run --example kern_verify -- examples/riscv-hello/geos_clock_demo.elf"
