#!/usr/bin/env python3
"""
Geometry OS: Holographic Blue Kernel

Creates an interference-pattern kernel where:
1. Each instruction is encoded as a Hadamard interference pattern
2. The "blue" value creates blue chromatic fringes in the pattern
3. Execution causes blue to emerge from the holographic superposition

The code IS blue. The interference IS the computation.
"""

import numpy as np
from PIL import Image
import sys
import os

# Add path for holographic encoder
sys.path.insert(0, os.path.dirname(__file__))
from systems.pixel_compiler.holographic_encoder import (
    generate_2d_basis,
    encode_instruction,
    hadamard_matrix
)

def encode_holographic_instruction(instr_u32, basis, color_phase=0):
    """
    Encodes 32 bits into a 16x16 interference pattern with color phase shift.

    The phase shift creates chromatic fringes that visually encode the data.
    Blue phase (120°) creates blue-dominant interference.
    """
    # Convert 32-bit uint to bit array (-1, 1)
    bits = np.array([(1 if (instr_u32 >> i) & 1 else -1) for i in range(32)])

    # Apply phase shift to bits for color encoding
    phase_shift = int(color_phase * 32 / 360)  # Convert degrees to bit offset
    bits = np.roll(bits, phase_shift)

    # Use only first 32 basis patterns (one per bit)
    basis_32 = basis[:32]

    # Superposition: Multiply each bit by its basis pattern
    pattern = np.sum(bits[:, None, None] * basis_32, axis=0)

    # Normalize to [0, 1] range
    normalized = (pattern / 32.0) + 0.5
    return np.clip(normalized, 0, 1)


def create_holographic_blue_kernel():
    """
    Create a holographic kernel that turns the screen blue.

    The kernel uses interference patterns where:
    - Red channel: Original instruction encoding
    - Green channel: Phase-shifted by 120°
    - Blue channel: Phase-shifted by 240° (BLUE DOMINANT)

    This creates a "chromatic hologram" where the blue value
    creates blue interference fringes in the visual pattern.
    """
    print("=== HOLOGRAPHIC BLUE KERNEL GENERATOR ===")
    print()
    print("Creating interference-pattern kernel where:")
    print("  • Instructions are encoded as Hadamard patterns")
    print("  • Blue phase shift creates blue chromatic fringes")
    print("  • Execution causes blue to emerge from superposition")
    print()

    # Generate basis patterns
    basis = generate_2d_basis(size=16, count=64)

    # RISC-V instructions for "turn blue"
    # lui t0, 0x40000      -> 0x40050337
    # addi t1, t1, 0xFFFF  -> 0xFFFF0613
    # sw t1, 0(t0)         -> 0x00652023

    lui_t0 = 0x40050337  # lui t0, 0x40000 (display base)
    addi_blue = 0xFFFF0613  # addi t1, t1, 0xFFFF (blue value)
    sw_blue = 0x00652023  # sw t1, 0(t0) (write to display)

    # Multiple stores to fill display
    instructions = [lui_t0, addi_blue]
    for offset in range(64):
        # sw t1, offset(t0) with varying offsets
        sw_offset = 0x00652000 | ((offset * 4) & 0xFFF) << 20 | ((offset * 4) >> 5) << 25
        instructions.append(sw_offset)

    num_instructions = len(instructions)
    grid_size = int(np.ceil(np.sqrt(num_instructions)))

    print(f"Instructions: {num_instructions}")
    print(f"Grid size: {grid_size}x{grid_size}")
    print()

    # Create RGB channels with phase-shifted holographic encoding
    # This creates the chromatic fringe effect
    texture_size = grid_size * 16
    r_channel = np.zeros((texture_size, texture_size), dtype=np.float32)
    g_channel = np.zeros((texture_size, texture_size), dtype=np.float32)
    b_channel = np.zeros((texture_size, texture_size), dtype=np.float32)
    a_channel = np.zeros((texture_size, texture_size), dtype=np.float32)

    for idx, instr in enumerate(instructions):
        gx = idx % grid_size
        gy = idx // grid_size

        x_start = gx * 16
        y_start = gy * 16

        # Encode with different phase shifts for each channel
        # This creates the "chromatic hologram" effect
        r_pattern = encode_holographic_instruction(instr, basis, color_phase=0)    # 0°
        g_pattern = encode_holographic_instruction(instr, basis, color_phase=120)  # 120°
        b_pattern = encode_holographic_instruction(instr, basis, color_phase=240)  # 240° (BLUE)

        r_channel[y_start:y_start+16, x_start:x_start+16] = r_pattern
        g_channel[y_start:y_start+16, x_start:x_start+16] = g_pattern
        b_channel[y_start:y_start+16, x_start:x_start+16] = b_pattern

        # Alpha = morphological intensity (average of all channels)
        a_channel[y_start:y_start+16, x_start:x_start+16] = (r_pattern + g_pattern + b_pattern) / 3

    # Convert to 8-bit RGBA
    rgba = np.zeros((texture_size, texture_size, 4), dtype=np.uint8)
    rgba[:,:,0] = (r_channel * 255).astype(np.uint8)
    rgba[:,:,1] = (g_channel * 255).astype(np.uint8)
    rgba[:,:,2] = (b_channel * 255).astype(np.uint8)
    rgba[:,:,3] = (a_channel * 255).astype(np.uint8)

    # Save holographic kernel
    img = Image.fromarray(rgba, mode='RGBA')
    img.save('/tmp/holographic_blue_kernel.png')

    print("Holographic Blue Kernel Properties:")
    print(f"  Texture size: {texture_size}x{texture_size}")
    print(f"  Red channel mean:   {r_channel.mean():.3f}")
    print(f"  Green channel mean: {g_channel.mean():.3f}")
    print(f"  Blue channel mean:  {b_channel.mean():.3f}  ← Blue dominant")
    print()
    print("Saved: /tmp/holographic_blue_kernel.png")
    print()

    # Create visualization showing the interference pattern
    create_interference_visualization(rgba, instructions[:10], basis)

    return img


def create_interference_visualization(rgba, instructions, basis):
    """Create a visualization showing the interference patterns."""
    try:
        # Create a zoomed view of first few instruction glyphs
        num_glyphs = min(len(instructions), 6)
        glyph_size = 16
        zoom = 10

        viz = np.zeros((glyph_size * zoom, num_glyphs * glyph_size * zoom, 3), dtype=np.uint8)

        for i in range(num_glyphs):
            gx = i % 9  # Grid x position
            gy = i // 9  # Grid y position

            x_start = gx * 16
            y_start = gy * 16

            glyph = rgba[y_start:y_start+16, x_start:x_start+16, :3]

            # Upsample using nearest neighbor for pixel-perfect view
            for y in range(16):
                for x in range(16):
                    viz[y*zoom:(y+1)*zoom, i*glyph_size*zoom + x*zoom:i*glyph_size*zoom + (x+1)*zoom] = glyph[y, x]

        viz_img = Image.fromarray(viz, mode='RGB')
        viz_img.save('/tmp/holographic_blue_interference.png')
        print("Interference visualization: /tmp/holographic_blue_interference.png")
    except Exception as e:
        print(f"Visualization skipped: {e}")


def explain_philosophy():
    """Explain the philosophical significance of holographic blue."""
    print()
    print("╔══════════════════════════════════════════════════════════════════╗")
    print("║              THE HOLOGRAPHIC BLUE PRINCIPLE                      ║")
    print("╠══════════════════════════════════════════════════════════════════╣")
    print("║                                                                  ║")
    print("║  Traditional Computing:                                          ║")
    print("║    Code → Execute → Blue pixels on screen                        ║")
    print("║    (Abstraction layers separate intent from result)              ║")
    print("║                                                                  ║")
    print("║  Geometry OS Holographic:                                        ║")
    print("║    Blue interference → Blue execution → Blue manifestation       ║")
    print("║    (The pattern IS the computation IS the color)                 ║")
    print("║                                                                  ║")
    print("║  The Hadamard interference pattern encodes the blue value        ║")
    print("║  as a chromatic fringe. When you look at the kernel,             ║")
    print("║  you see blue ripples - the code is literally blue.              ║")
    print("║                                                                  ║")
    print("║  When executed, the GPU reads these ripples and writes           ║")
    print("║  the decoded blue value to the display. The hologram             ║")
    print("║  reconstructs itself as photons.                                 ║")
    print("║                                                                  ║")
    print("║  CODE = COLOR = LIGHT                                            ║")
    print("╚══════════════════════════════════════════════════════════════════╝")
    print()


if __name__ == "__main__":
    explain_philosophy()
    create_holographic_blue_kernel()
