#!/bin/bash
# ============================================================================
# GEOMETRY OS - Glyph-Native Boot Script
# ============================================================================
#
# This script boots the pure glyph-native infinite map.
# No Rust compositor - just glyph execution on GPU.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo ""
echo "  ╔═══════════════════════════════════════════════════════════════╗"
echo "  ║              GEOMETRY OS - Glyph-Native Boot                   ║"
echo "  ║                                                               ║"
echo "  ║   The screen IS the CPU. Every glyph IS an instruction.     ║"
echo "  ║   This is not a simulation. This is the real thing.          ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo ""

# Step 1: Compile the seed glyph
echo "[COMPILE] Assembling seed.glyph..."
cd "$PROJECT_ROOT/systems/glyph_stratum/programs"

# Check if the Rust compiler is available
if command -v cargo &> /dev/null; then
    echo "[COMPILE] Using glyph_to_rts compiler..."

    # Compile via Rust
    cd "$PROJECT_ROOT/systems/infinite_map_rs"
    cargo run --release --bin glyphc -- \
        "../glyph_stratum/programs/seed.glyph" \
        "seed.rts.png" 2>/dev/null || {
        echo "[COMPILE] glyphc not available, using pre-compiled seed"
    }
else
    echo "[COMPILE] Cargo not found, using pre-compiled seed"
fi

# Step 2: Check for output
if [ ! -f "$PROJECT_ROOT/systems/infinite_map_rs/seed.rts.png" ]; then
    echo "[COMPILE] Creating minimal seed.rts.png..."

    # Create a minimal 4096x4096 texture with a simple boot program
    # This is a fallback if the compiler isn't available
    python3 -c "
from PIL import Image
import struct

# Create 4096x4096 RGBA8 texture
img = Image.new('RGBA', (4096, 4096), (0, 2, 0, 0))

# Write a simple boot sequence at Hilbert origin (0,0) to (0,10)
# Format: R=opcode, G=stratum(2=LOGIC), B=p1, A=p2

# MOV r20, 0 (opcode 206, stratum 2, p1=20, p2=0)
img.putpixel((0, 0), (206, 2, 20, 0))
# MOV r21, 0
img.putpixel((0, 1), (206, 2, 21, 0))
# MOV r22, 0x10 (zoom = 1.0 in fixed point, simplified)
img.putpixel((0, 2), (206, 2, 22, 16))
# MOV r23, 1920
img.putpixel((0, 3), (206, 2, 23, 0))
# MOV r24, 1080
img.putpixel((0, 4), (206, 2, 24, 0))
# CAMERA r23, r24 (opcode 230)
img.putpixel((0, 5), (230, 3, 23, 24))
# YIELD (opcode 227)
img.putpixel((0, 6), (227, 2, 0, 0))
# JMP to 5 (loop back to CAMERA)
img.putpixel((0, 7), (9, 2, 5, 0))

img.save('$PROJECT_ROOT/systems/infinite_map_rs/seed.rts.png')
print('Created seed.rts.png')
"
fi

echo "[COMPILE] ✓ seed.rts.png ready"
echo ""

# Step 3: Boot the Visual Kernel
echo "[BOOT] Starting Visual Kernel with seed glyph..."
echo ""

cd "$PROJECT_ROOT/systems/infinite_map_rs"

# Run the visual kernel
cargo run --release --bin visual_kernel -- --rts seed.rts.png

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  Glyph-Native Infinite Map has ended."
echo "═══════════════════════════════════════════════════════════════"
