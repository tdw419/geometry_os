#!/usr/bin/env python3
"""
Generate test assets for GlyphExecutor E2E testing.
Creates:
1. hello_test.bin - Simple RISC-V binary
2. hello_test.rts.png - Morphological texture
3. hello_test.rts.png.meta.json - Dictionary metadata
"""

import struct
import sys
from pathlib import Path

# Add to path for imports
sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parent / "systems/pixel_compiler"))

def create_test_binary(output_path):
    """Create a minimal test binary with simple RISC-V instructions."""
    instructions = [
        # Simple add sequence
        0x00100093,  # ADDI x1, x0, 1    (x1 = 1)
        0x00200113,  # ADDI x2, x0, 2    (x2 = 2)
        0x002081b3,  # ADD  x3, x1, x2   (x3 = 3)
        0x00000013,  # NOP
        0x00000013,  # NOP
        # More operations
        0x00100193,  # ADDI x3, x0, 1
        0x00300213,  # ADDI x4, x0, 3
        0x00400293,  # ADDI x5, x0, 4
        0x00000013,  # NOP
        0x00000013,  # NOP
        # Loop back to self (infinite)
        0x00128293,  # ADDI x5, x5, 1    (x5++)
        0xfe5290e3,  # BNE  x5, x5, -28  (should never branch, x5 == x5)
        # Halt
        0x00100073,  # EBREAK
    ]

    with open(output_path, 'wb') as f:
        for inst in instructions:
            f.write(struct.pack('<I', inst))

    print(f"Created test binary: {output_path}")
    print(f"  Instructions: {len(instructions)}")
    return len(instructions)


def main():
    # Output directory
    output_dir = Path(__file__).parent / "systems/visual_shell/web/assets"
    output_dir.mkdir(parents=True, exist_ok=True)

    # Create binary
    bin_path = output_dir / "hello_test.bin"
    create_test_binary(bin_path)

    # Try to encode using the morphological encoder
    try:
        from riscv_morphological_encoder import RISCVMorphologicalEncoder

        png_path = output_dir / "hello_test.rts.png"
        encoder = RISCVMorphologicalEncoder(use_unique_tokens=True, tile_mode=True)
        encoder.encode(str(bin_path), str(png_path))
        print(f"\nTest assets generated in: {output_dir}")

    except ImportError as e:
        print(f"\nWarning: Could not import encoder: {e}")
        print("You may need to run the encoder manually:")
        print(f"  python3 riscv_morphological_encoder.py {bin_path} {output_dir}/hello_test.rts.png")

    except Exception as e:
        print(f"\nWarning: Encoding failed: {e}")
        print("You may need to run the encoder manually")


if __name__ == '__main__':
    main()
