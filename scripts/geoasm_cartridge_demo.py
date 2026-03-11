#!/usr/bin/env python3
"""
GeoASM Cartridge Demo

Demonstrates the full GeoASM ↔ PixelRTS v2 containerization pipeline:
1. Assemble GeoASM neural program
2. Package into .rts.png cartridge
3. Read cartridge back
4. Verify roundtrip integrity
"""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.pixel_compiler.geoasm_cartridge import GeoASMCartridgeWriter
from systems.pixel_compiler.geoasm_cartridge_reader import GeoASMCartridgeReader


def main():
    """Run the cartridge demo."""
    print("=" * 60)
    print("GeoASM ↔ PixelRTS v2 Cartridge Demo")
    print("=" * 60)

    # 1. Define 8-layer transformer inference program
    print("\n[1] GeoASM Neural Program:")
    source = """
    ; 8-Layer Transformer Inference Program
    ; Each layer: ATTEND (self-attention) + PROJECT (FFN)

    EMBED R1, R2       ; Token → Hidden state

    LAYER #0
    ATTEND R2, R2      ; Self-attention (brightest red)
    PROJECT R2, R2     ; FFN projection

    LAYER #1
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #2
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #3
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #4
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #5
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #6
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #7
    ATTEND R2, R2
    PROJECT R2, R2

    SAMPLE R2, R5      ; Hidden → Token
    THOUGHT_PULSE R5   ; Emit visual glyph
    """

    print(source)

    # 2. Create cartridge
    print("[2] Creating Cartridge...")
    output_path = "/tmp/geoasm_neural_core.rts.png"

    writer = GeoASMCartridgeWriter(lossless=True)
    metadata = writer.create_cartridge(
        source,
        output_path,
        name="neural_core",
        version="1.0",
        description="8-layer transformer inference program"
    )

    print(f"    Created: {output_path}")
    print(f"    Instructions: {metadata['instruction_count']}")
    print(f"    Grid size: {metadata['grid_size']}x{metadata['grid_size']}")
    print(f"    Hash: {metadata['sha256'][:16]}...")

    # 3. Read cartridge back
    print("\n[3] Reading Cartridge...")
    reader = GeoASMCartridgeReader()
    program = reader.read_cartridge(output_path)

    print(f"    Read {len(program)} instructions")

    # Show instruction distribution
    opcodes = {}
    for inst in program:
        name = inst.opcode.name
        opcodes[name] = opcodes.get(name, 0) + 1

    print("    Opcode distribution:")
    for name, count in sorted(opcodes.items()):
        print(f"      {name}: {count}")

    # 4. Verify roundtrip
    print("\n[4] Verifying Roundtrip...")

    from systems.visual_shell.geoasm import Assembler
    assembler = Assembler()
    original = assembler.assemble(source)

    all_match = True
    mismatches = []
    for i, (orig, read) in enumerate(zip(original, program)):
        if orig.opcode != read.opcode:
            mismatches.append(f"{i}: opcode {orig.opcode} != {read.opcode}")
            all_match = False
        if orig.rs != read.rs:
            mismatches.append(f"{i}: rs {orig.rs} != {read.rs}")
            all_match = False
        if orig.rd != read.rd:
            mismatches.append(f"{i}: rd {orig.rd} != {read.rd}")
            all_match = False
        if orig.imm != read.imm:
            mismatches.append(f"{i}: imm {orig.imm} != {read.imm}")
            all_match = False

    if all_match:
        print("    ✅ Roundtrip verified - all instructions match")
    else:
        print("    ❌ Roundtrip failed:")
        for m in mismatches[:5]:
            print(f"      {m}")
        return 1

    # 5. Visual analysis
    print("\n[5] Visual Analysis:")
    print(f"    Cartridge: {output_path}")
    print(f"    Metadata: {output_path}.meta.json")
    print()
    print("    Color interpretation:")
    print("      Red   = Opcode (ATTEND brightest, LAYER dimmest)")
    print("      Green = Source register (R0-R7)")
    print("      Blue  = Destination register (R0-R7)")
    print("      Alpha = Immediate value (0-255)")
    print()
    print("    Visual patterns:")
    print("      - Bright red bands = ATTEND operations (high compute)")
    print("      - Alternating pattern = ATTEND/PROJECT pairs")
    print("      - LAYER ops appear as dim red pixels")

    # Cleanup
    Path(output_path).unlink(missing_ok=True)
    Path(output_path + '.meta.json').unlink(missing_ok=True)

    print("\n" + "=" * 60)
    print("GeoASM Cartridge Demo Complete!")
    print("=" * 60)

    return 0


if __name__ == "__main__":
    sys.exit(main())
