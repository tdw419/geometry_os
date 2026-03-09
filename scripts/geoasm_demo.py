#!/usr/bin/env python3
"""
GeoASM Demo - Neural Assembly Language in Action

Demonstrates the full GeoASM pipeline:
1. Assemble neural program from text
2. Execute against PixelBrain
3. Visualize thought pulses
"""

import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.visual_shell.geoasm import (
    Assembler, Executor, RegisterFile,
    R0, R1, R2, R3, R4, R5, R6, R7,
    GeoASMVisualBridge,
)
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline


def main():
    """Run the GeoASM demo."""
    print("=" * 60)
    print("GeoASM - Geometry OS Neural Assembly Language")
    print("=" * 60)

    # 1. Load PixelBrain
    print("\n[1] Loading PixelBrain...")
    brain_path = Path("tinystories_brain.rts.png")
    if not brain_path.exists():
        print(f"ERROR: {brain_path} not found")
        return 1

    try:
        pipeline = PixelBrainPipeline(str(brain_path))
    except Exception as e:
        print(f"ERROR: Failed to initialize GPU pipeline: {e}")
        return 1
        
    print(f"    Model: {pipeline.model_id}")
    # print(f"    Config: dim={pipeline.config.get('dim')}, layers={pipeline.config.get('layers')}")

    # 2. Create visual bridge
    print("\n[2] Creating visual bridge...")
    visual = GeoASMVisualBridge()

    # 3. Assemble program
    print("\n[3] Assembling program...")
    assembler = Assembler()

    program_text = """
    ; GeoASM Neural Inference Program
    ; Generate tokens from a prompt

    EMBED R1, R2      ; Token → Hidden

    ; Process through 8 transformer layers
    LAYER #0
    ATTEND R2, R2     ; Self-attention (in-place)
    PROJECT R2, R2    ; FFN (in-place)

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

    SAMPLE R2, R5     ; Hidden → Token
    THOUGHT_PULSE R5  ; Emit visual
    """

    program = assembler.assemble(program_text)
    print(f"    Assembled {len(program)} instructions")

    # Show binary representation
    binary = assembler.assemble_to_bytes(program_text)
    print(f"    Binary size: {len(binary)} bytes")

    # 4. Execute program
    print("\n[4] Executing program...")
    registers = RegisterFile()
    executor = Executor(pipeline, registers, visual_bridge=visual)

    # Set input token (0 = beginning of sequence)
    registers.set(R1, 0)

    results = executor.run(program)

    print(f"    Instructions executed: {results['instructions_executed']}")
    print(f"    Errors: {len(results['errors'])}")

    # 5. Show results
    print("\n[5] Results:")
    output_token = int(registers.get(R5))
    print(f"    Output token: {output_token}")

    # Show visual events
    events = visual.get_events()
    print(f"    Visual events: {len(events)}")
    for evt in events[-3:]:
        print(f"      - {evt['type']}: {evt['data']}")

    print("\n" + "=" * 60)
    print("GeoASM execution complete!")
    print("=" * 60)

    return 0


if __name__ == "__main__":
    sys.exit(main())
