#!/bin/bash
# Geometry OS QEMU Test Boot
# Tests UEFI → kernel handoff without requiring AMD hardware

set -e

GEOS_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
BOOT_IMG="$GEOS_ROOT/kernel/boot/geometry_os_boot.img"
OVMF_CODE="/usr/share/OVMF/OVMF_CODE_4M.fd"
OVMF_VARS="/usr/share/OVMF/OVMF_VARS_4M.fd"

# Create a copy of OVMF vars (required for writeable NVRAM)
VARS_TMP="/tmp/geos_ovmf_vars.fd"
cp "$OVMF_VARS" "$VARS_TMP"

echo "=============================================="
echo "  Geometry OS - QEMU Boot Test"
echo "=============================================="
echo ""
echo "Boot image: $BOOT_IMG"
echo "UEFI firmware: $OVMF_CODE"
echo ""

if [ ! -f "$BOOT_IMG" ]; then
    echo "ERROR: Boot image not found. Run 'make' in kernel/geos first."
    exit 1
fi

# Run QEMU with:
# - UEFI boot (OVMF)
# - Serial output to file (for kernel debug messages)
# - Boot from our image
# - No GPU requirements (stdvga for display, serial for output)

SERIAL_LOG="/tmp/geos_serial.log"

qemu-system-x86_64 \
    -machine q35,accel=tcg \
    -cpu qemu64 \
    -m 512M \
    -drive if=pflash,format=raw,readonly=on,file="$OVMF_CODE" \
    -drive if=pflash,format=raw,file="$VARS_TMP" \
    -drive file="$BOOT_IMG",format=raw,if=ide \
    -boot c \
    -serial file:"$SERIAL_LOG" \
    -display none \
    -no-reboot \
    "$@" &

QEMU_PID=$!
echo "QEMU started (PID: $QEMU_PID)"
echo "Serial log: $SERIAL_LOG"
echo ""
echo "Waiting for boot (5 seconds)..."
sleep 5

echo "=== Serial Output ==="
cat "$SERIAL_LOG" 2>/dev/null || echo "(no output yet)"

echo ""
echo "=== Stopping QEMU ==="
kill $QEMU_PID 2>/dev/null || true
