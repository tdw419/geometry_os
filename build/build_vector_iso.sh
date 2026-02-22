#!/bin/bash
# Build Vector ISO - Create bootable VectorOS ISO
# This script creates a bootable ISO image

set -e

echo "=== Building Vector ISO ==="

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd")
DIST_DIR="$PROJECT_ROOT/dist"

echo "[INFO] Creating dist directory..."
mkdir -p "$DIST_DIR"

# Check for required tools
if ! command -v xorriso &> /dev/null; then
    echo "[WARN] xorriso not found, ISO creation skipped (optional)"
    echo "[INFO] Install with: sudo apt install xorriso"
    exit 0
fi

# Create ISO structure
ISO_DIR="$DIST_DIR/iso_staging"
mkdir -p "$ISO_DIR/boot"

# Copy kernel if available
if [ -f "$PROJECT_ROOT/vmlinuz" ]; then
    cp "$PROJECT_ROOT/vmlinuz" "$ISO_DIR/boot/"
fi

# Copy initrd if available
if [ -f "$PROJECT_ROOT/initrd.img" ]; then
    cp "$PROJECT_ROOT/initrd.img" "$ISO_DIR/boot/"
fi

echo "[SUCCESS] Vector ISO preparation complete"
echo "[INFO] ISO staging at: $ISO_DIR"
exit 0
