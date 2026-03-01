#!/usr/bin/env python3
"""
Geometry OS: Holographic Linux Kernel Generator

Transforms a Linux vmlinuz binary into a holographic interference pattern
that can be executed by the riscv_linux_vm.wgsl GPU shader.

Phase 6: Linux Boot via Holographic Text Substrate

The kernel is encoded as:
- Each 32-bit instruction becomes a 16x16 Hadamard interference glyph
- RGB channels encode the instruction with chromatic phase shifts
- Alpha channel encodes morphological intensity (execution density)
- Hilbert curve ordering preserves spatial locality of code

CODE = COLOR = LIGHT
The kernel IS the display. Boot IS visualization.
"""

import numpy as np
from PIL import Image
import struct
import sys
import os

# Add path for holographic encoder
sys.path.insert(0, os.path.dirname(__file__))
from systems.pixel_compiler.holographic_encoder import generate_2d_basis

# Configuration
GLYPH_SIZE = 16
INSTRUCTIONS_PER_ROW = 64  # Texture grid width


def encode_holographic_instruction_hadamard(instr_u32, basis, color_phase=0):
    """
    Encodes 32 bits into a 16x16 interference pattern with color phase shift.
    Uses Hadamard matrix for interference pattern generation.
    """
    # Convert 32-bit uint to bit array (-1, 1)
    bits = np.array([(1 if (instr_u32 >> i) & 1 else -1) for i in range(32)])

    # Apply phase shift for chromatic encoding
    phase_shift = int(color_phase * 32 / 360)
    bits = np.roll(bits, phase_shift)

    # Use first 32 basis patterns
    basis_32 = basis[:32]

    # Superposition: Multiply each bit by its basis pattern
    pattern = np.sum(bits[:, None, None] * basis_32, axis=0)

    # Normalize to [0, 1] range
    normalized = (pattern / 32.0) + 0.5
    return np.clip(normalized, 0, 1)


def hadamard_sign(i, j):
    """Compute Hadamard matrix sign at position (i, j)."""
    p = bin(i & j).count('1')
    return 1 if p % 2 == 0 else -1


def encode_holographic_glyph_simple(instruction_u32):
    """Simple Hadamard encoding without external basis."""
    glyph = np.zeros((GLYPH_SIZE, GLYPH_SIZE), dtype=np.float32)
    for k in range(32):
        bit_set = (instruction_u32 >> k) & 1
        row_k = (k // 8) + 1
        col_k = (k % 8) + 1

        for i in range(GLYPH_SIZE):
            for j in range(GLYPH_SIZE):
                h_val = hadamard_sign(i, row_k) * hadamard_sign(j, col_k)
                if bit_set:
                    glyph[i, j] += h_val
                else:
                    glyph[i, j] -= h_val

    # Normalize to 0.0-1.0
    glyph = (glyph / 64.0) + 0.5
    return np.clip(glyph, 0.0, 1.0)


def analyze_kernel_header(vmlinuz_path):
    """Analyze the Linux kernel binary header."""
    with open(vmlinuz_path, 'rb') as f:
        # Read first 64 bytes for header analysis
        header = f.read(64)

        # Check for Linux kernel magic
        # Linux arm64 header starts at offset 0x38
        # x86 header has specific signatures

        f.seek(0, 2)  # Seek to end
        size = f.tell()

        print(f"  Binary size: {size:,} bytes")
        print(f"  32-bit words: {size // 4:,}")

        # Try to detect architecture
        f.seek(0)
        magic = f.read(4)

        if magic[:4] == b'\x7fELF':
            print("  Format: ELF executable")
        elif magic[:2] == b'MZ':
            print("  Format: PE/COFF (EFI stub)")
        else:
            print(f"  Format: Raw binary (magic: {magic.hex()})")

        return size


def create_holographic_kernel(vmlinuz_path, output_png, max_instructions=None):
    """
    Transform a Linux kernel binary into a holographic interference texture.

    Args:
        vmlinuz_path: Path to the vmlinuz binary
        output_png: Output path for the .rts.png holographic texture
        max_instructions: Optional limit on instructions to encode
    """
    print("=" * 60)
    print("HOLOGRAPHIC LINUX KERNEL GENERATOR")
    print("=" * 60)
    print()
    print(f"Input:  {vmlinuz_path}")
    print(f"Output: {output_png}")
    print()

    # Analyze kernel
    print("Analyzing kernel binary...")
    kernel_size = analyze_kernel_header(vmlinuz_path)
    print()

    # Generate basis patterns
    print("Generating Hadamard basis patterns...")
    try:
        basis = generate_2d_basis(size=16, count=64)
        use_basis = True
        print("  Using optimized basis from holographic_encoder")
    except Exception as e:
        print(f"  Falling back to simple Hadamard: {e}")
        use_basis = False
    print()

    # Read kernel binary
    print("Reading kernel binary...")
    with open(vmlinuz_path, 'rb') as f:
        kernel_data = f.read()

    # Convert to 32-bit words (little-endian)
    num_words = len(kernel_data) // 4
    if max_instructions:
        num_words = min(num_words, max_instructions)

    print(f"  Encoding {num_words:,} instructions...")
    print()

    # Calculate texture dimensions
    grid_width = INSTRUCTIONS_PER_ROW
    grid_height = (num_words + grid_width - 1) // grid_width
    texture_size = grid_height * GLYPH_SIZE

    # Limit texture size for practicality
    max_texture = 8192
    if texture_size > max_texture:
        grid_height = max_texture // GLYPH_SIZE
        num_words = grid_height * grid_width
        texture_size = max_texture
        print(f"  Limiting to {num_words:,} instructions (texture size limit)")

    print(f"Texture Configuration:")
    print(f"  Grid: {grid_width}x{grid_height} glyphs")
    print(f"  Size: {texture_size}x{texture_size} pixels")
    print(f"  Glyphs: {num_words:,}")
    print()

    # Create RGBA channels
    r_channel = np.zeros((texture_size, texture_size), dtype=np.float32)
    g_channel = np.zeros((texture_size, texture_size), dtype=np.float32)
    b_channel = np.zeros((texture_size, texture_size), dtype=np.float32)
    a_channel = np.zeros((texture_size, texture_size), dtype=np.float32)

    # Encode each instruction
    print("Encoding holographic interference patterns...")

    # Track instruction types for analysis
    opcode_counts = {}

    for idx in range(num_words):
        if idx % 10000 == 0:
            print(f"  Progress: {idx:,}/{num_words:,} ({100*idx/num_words:.1f}%)")

        # Read 32-bit word
        word_offset = idx * 4
        if word_offset + 4 > len(kernel_data):
            break

        instr_u32 = struct.unpack('<I', kernel_data[word_offset:word_offset+4])[0]

        # Analyze opcode (bits 6:0)
        opcode = instr_u32 & 0x7F
        opcode_counts[opcode] = opcode_counts.get(opcode, 0) + 1

        # Calculate grid position
        gx = idx % grid_width
        gy = idx // grid_width

        x_start = gx * GLYPH_SIZE
        y_start = gy * GLYPH_SIZE

        # Encode with chromatic phase shifts
        if use_basis:
            r_pattern = encode_holographic_instruction_hadamard(instr_u32, basis, 0)
            g_pattern = encode_holographic_instruction_hadamard(instr_u32, basis, 120)
            b_pattern = encode_holographic_instruction_hadamard(instr_u32, basis, 240)
        else:
            r_pattern = encode_holographic_glyph_simple(instr_u32)
            # Apply phase shifts by rotating the pattern
            g_pattern = np.roll(r_pattern, 4, axis=0)
            b_pattern = np.roll(r_pattern, 8, axis=0)

        r_channel[y_start:y_start+GLYPH_SIZE, x_start:x_start+GLYPH_SIZE] = r_pattern
        g_channel[y_start:y_start+GLYPH_SIZE, x_start:x_start+GLYPH_SIZE] = g_pattern
        b_channel[y_start:y_start+GLYPH_SIZE, x_start:x_start+GLYPH_SIZE] = b_pattern

        # Alpha = morphological intensity
        a_channel[y_start:y_start+GLYPH_SIZE, x_start:x_start+GLYPH_SIZE] = (r_pattern + g_pattern + b_pattern) / 3

    print(f"  Progress: {num_words:,}/{num_words:,} (100.0%)")
    print()

    # Convert to 8-bit RGBA
    rgba = np.zeros((texture_size, texture_size, 4), dtype=np.uint8)
    rgba[:,:,0] = (r_channel * 255).astype(np.uint8)
    rgba[:,:,1] = (g_channel * 255).astype(np.uint8)
    rgba[:,:,2] = (b_channel * 255).astype(np.uint8)
    rgba[:,:,3] = (a_channel * 255).astype(np.uint8)

    # Save holographic kernel
    img = Image.fromarray(rgba, mode='RGBA')
    img.save(output_png)

    print(f"Holographic Kernel Properties:")
    print(f"  Red channel mean:   {r_channel.mean():.3f}")
    print(f"  Green channel mean: {g_channel.mean():.3f}")
    print(f"  Blue channel mean:  {b_channel.mean():.3f}")
    print(f"  Alpha channel mean: {a_channel.mean():.3f}")
    print()

    # Analyze opcode distribution
    print("Opcode Distribution (top 10):")
    opcode_names = {
        0x03: 'LOAD', 0x13: 'OP_IMM', 0x17: 'AUIPC', 0x23: 'STORE',
        0x33: 'OP', 0x37: 'LUI', 0x2F: 'AMO', 0x6F: 'JAL',
        0x67: 'JALR', 0x63: 'BRANCH', 0x0F: 'MISC_MEM', 0x73: 'SYSTEM'
    }
    sorted_opcodes = sorted(opcode_counts.items(), key=lambda x: -x[1])[:10]
    for opcode, count in sorted_opcodes:
        name = opcode_names.get(opcode, f'0x{opcode:02X}')
        pct = 100 * count / num_words
        bar = '█' * int(pct / 2)
        print(f"  {name:12} {count:8,} ({pct:5.1f}%) {bar}")

    print()
    print(f"✅ Generated Holographic Linux Kernel: {output_png}")
    print(f"   Size: {texture_size}x{texture_size} pixels")
    print(f"   Instructions encoded: {num_words:,}")
    print()

    # Create VCC contract
    create_vcc_contract(output_png, num_words)

    return img


def create_vcc_contract(kernel_path, num_instructions):
    """Create a Visual Consistency Contract for the Linux kernel."""
    try:
        from systems.health.visual_consistency_contract import VisualConsistencyContractor

        vcc = VisualConsistencyContractor()
        contract = vcc.create_contract(
            kernel_path=kernel_path,
            semantic_meaning=f"Linux Kernel Holographic Boot ({num_instructions:,} instructions)"
        )
        print(f"📋 VCC Contract created: {contract.contract_id}")
        print(f"   The kernel's visual state is now mathematically bound to its code.")
    except Exception as e:
        print(f"⚠️  VCC registration skipped: {e}")


def main():
    """Generate holographic Linux kernel from vmlinuz."""
    print()
    print("╔══════════════════════════════════════════════════════════════════╗")
    print("║          PHASE 6: LINUX BOOT VIA HOLOGRAPHIC TEXT                ║")
    print("╠══════════════════════════════════════════════════════════════════╣")
    print("║                                                                  ║")
    print("║  The Linux kernel is not a file.                                ║")
    print("║  It is a Holographic Light Manifold.                            ║")
    print("║                                                                  ║")
    print("║  When executed, the GPU reads interference patterns              ║")
    print("║  and reconstructs the operating system as photons.               ║")
    print("║                                                                  ║")
    print("║  CODE = COLOR = LIGHT                                            ║")
    print("║  KERNEL = TEXTURE = BOOT                                         ║")
    print("╚══════════════════════════════════════════════════════════════════╝")
    print()

    # Default paths
    vmlinuz_path = "vmlinuz-virt-reconstructed"
    output_png = "/tmp/linux_hologram.rts.png"

    # Parse arguments
    if len(sys.argv) > 1:
        vmlinuz_path = sys.argv[1]
    if len(sys.argv) > 2:
        output_png = sys.argv[2]

    if not os.path.exists(vmlinuz_path):
        print(f"❌ Kernel not found: {vmlinuz_path}")
        print("   Please provide a valid vmlinuz path")
        sys.exit(1)

    # For initial testing, limit instructions
    # Remove max_instructions for full kernel encoding
    create_holographic_kernel(vmlinuz_path, output_png, max_instructions=100000)

    print()
    print("=" * 60)
    print("NEXT STEPS:")
    print("=" * 60)
    print()
    print("1. Verify the holographic kernel:")
    print(f"   python3 holographic_perception_agent.py {output_png}")
    print()
    print("2. Boot via SPIR-V Subgroup Executor:")
    print(f"   cd systems/infinite_map_rs")
    print(f"   cargo run --release --bin run_riscv -- {output_png} --boot-target alpine")
    print()
    print("The kernel is now light. The boot is now visualization.")
    print()


if __name__ == "__main__":
    main()
