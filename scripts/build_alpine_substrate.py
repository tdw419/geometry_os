#!/usr/bin/env python3
"""
Build combined substrate: RISC-V emulator + Alpine kernel

Memory layout:
  0x00000 - 0x13FFF: RISC-V emulator (glyph program)
  0x14000: Guest PC
  0x14100: Guest registers (x0-x31)
  0x18000+: Guest RAM (Alpine kernel)

The substrate is a 4096x4096 RGBA8 texture addressed via Hilbert curve.
"""

import sys
import os
import struct
from pathlib import Path

# Add the project root to path
script_path = Path(__file__).resolve()
project_root = script_path.parents[1]

# Try to import PIL
try:
    from PIL import Image
except ImportError:
    print("Installing Pillow...")
    os.system(f"{sys.executable} -m pip install Pillow")
    from PIL import Image

# Hilbert curve functions
def hilbert_d2xy(n, d):
    """Convert Hilbert distance d to (x, y) coordinates for n x n grid."""
    x = y = 0
    s = 1
    while s < n:
        rx = 1 & (d // 2)
        ry = 1 & (d ^ rx)
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x
        x += s * rx
        y += s * ry
        d //= 4
        s *= 2
    return x, y

def hilbert_xy2d(n, x, y):
    """Convert (x, y) coordinates to Hilbert distance for n x n grid."""
    d = 0
    s = n // 2
    while s > 0:
        rx = 1 if (x & s) > 0 else 0
        ry = 1 if (y & s) > 0 else 0
        d += s * s * ((3 * rx) ^ ry)
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x
        s //= 2
    return d

# Glyph instruction opcodes (matching shader)
OPCODES = {
    'NOP': 0, 'LDI': 1, 'LDI16': 2, 'LDI32': 3, 'MOV': 4, 'SWAP': 5,
    'LOAD': 6, 'STORE': 7, 'FLUSH': 8, 'SPAWN': 9,
    'ADD': 10, 'SUB': 11, 'MUL': 12, 'DIV': 13, 'MOD': 14,
    'AND': 15, 'OR': 16, 'XOR': 17, 'NOT': 18, 'SHL': 19, 'SHR': 20,
    'CMP': 21, 'JMP': 22, 'JZ': 23, 'JNZ': 24, 'CALL': 25, 'RET': 26,
    'PUSH': 27, 'POP': 28, 'YIELD': 29, 'HALT': 30, 'DEBUG': 31,
    'ADDI': 32, 'SUBI': 33, 'MULI': 34, 'DIVI': 35, 'MODI': 36,
    'ANDI': 37, 'ORI': 38, 'XORI': 39, 'SHLI': 40, 'SHRI': 41,
}

def parse_register(reg_str):
    """Parse register string like 'r10' or 'r[10]' to register number."""
    reg_str = reg_str.strip()
    if reg_str.startswith('r[') and reg_str.endswith(']'):
        return int(reg_str[2:-1])
    elif reg_str.startswith('r'):
        return int(reg_str[1:])
    else:
        raise ValueError(f"Invalid register: {reg_str}")

def parse_immediate(imm_str):
    """Parse immediate value (decimal or hex)."""
    imm_str = imm_str.strip()
    if imm_str.startswith('0x') or imm_str.startswith('0X'):
        return int(imm_str, 16)
    elif imm_str.startswith('-'):
        return int(imm_str)
    else:
        return int(imm_str)

def compile_glyph_program(source):
    """Compile .glyph source to texture data."""
    lines = source.split('\n')
    instructions = []
    labels = {}
    pending_labels = []

    # First pass: collect labels
    pc = 0
    for line in lines:
        # Remove comments
        if '//' in line:
            line = line[:line.index('//')]
        if ';' in line:
            line = line[:line.index(';')]
        line = line.strip()

        if not line:
            continue

        # Check for .equ directive
        if line.startswith('.equ'):
            parts = line.split(',', 1)
            if len(parts) == 2:
                name = parts[0][4:].strip()
                value = parse_immediate(parts[1].strip())
                labels[name] = value
            continue

        # Check for label
        if line.startswith(':'):
            label_name = line[1:].strip()
            labels[label_name] = pc
            pending_labels.append((label_name, pc))
            continue

        # Count instruction
        pc += 1

    # Second pass: compile instructions
    pc = 0
    for line in lines:
        # Remove comments
        if '//' in line:
            line = line[:line.index('//')]
        if ';' in line:
            line = line[:line.index(';')]
        line = line.strip()

        if not line or line.startswith(':') or line.startswith('.equ'):
            continue

        # Parse instruction
        parts = line.replace(',', ' ').split()
        if not parts:
            continue

        opcode_str = parts[0].upper()
        if opcode_str not in OPCODES:
            print(f"Warning: Unknown opcode '{opcode_str}' at line {pc}")
            continue

        opcode = OPCODES[opcode_str]
        stratum = 2  # LOGIC stratum
        p1 = 0
        p2 = 0

        # Parse operands based on instruction type
        if opcode_str in ['LDI', 'LDI16', 'LDI32', 'LDI24']:
            # LDI rd, imm
            if len(parts) >= 3:
                p1 = parse_register(parts[1])
                imm_str = parts[2]
                if imm_str in labels:
                    p2 = labels[imm_str] & 0xFF
                elif imm_str.startswith('r'):
                    # It's actually a register (shouldn't happen for LDI, but handle it)
                    p2 = parse_register(imm_str)
                else:
                    try:
                        imm = parse_immediate(imm_str)
                        p2 = imm & 0xFF
                    except ValueError:
                        # Unknown label, use 0
                        p2 = 0

        elif opcode_str in ['MOV', 'ADD', 'SUB', 'MUL', 'DIV', 'MOD', 'AND', 'OR', 'XOR', 'SHL', 'SHR']:
            # OP rd, rs (result in rd)
            if len(parts) >= 3:
                p1 = parse_register(parts[1])
                p2 = parse_register(parts[2])

        elif opcode_str in ['LOAD', 'STORE']:
            # LOAD addr, rd / STORE addr, rs
            if len(parts) >= 3:
                addr_str = parts[1]
                if addr_str in labels:
                    p1 = labels[addr_str] & 0xFF
                else:
                    p1 = parse_register(addr_str)
                p2 = parse_register(parts[2])

        elif opcode_str in ['JMP', 'JZ', 'JNZ', 'CALL']:
            # JMP rs / JZ cond_reg, target_reg
            if len(parts) >= 2:
                p1 = parse_register(parts[1])
                if len(parts) >= 3:
                    target = parts[2]
                    # Check if it's a label first
                    if target in labels:
                        p2 = labels[target] & 0xFF
                    elif target.startswith('r'):
                        p2 = parse_register(target)
                    else:
                        try:
                            p2 = parse_immediate(target) & 0xFF
                        except ValueError:
                            # Unknown label - might be forward reference
                            p2 = 0
                else:
                    p2 = 0

        elif opcode_str == 'HALT':
            pass  # No operands

        instructions.append((opcode, stratum, p1, p2))
        pc += 1

    return instructions

def create_substrate_texture(instructions, guest_data=None, size=4096):
    """Create a 4096x4096 RGBA8 texture with the program and guest data."""
    # Create empty texture
    texture = bytearray(size * size * 4)

    # Write instructions using Hilbert addressing
    for i, (opcode, stratum, p1, p2) in enumerate(instructions):
        x, y = hilbert_d2xy(size, i)
        offset = (y * size + x) * 4
        texture[offset + 0] = opcode
        texture[offset + 1] = stratum
        texture[offset + 2] = p1
        texture[offset + 3] = p2

    # Write guest data at address 0x18000 (98304 in decimal)
    if guest_data:
        guest_start = 0x18000
        for i, val in enumerate(guest_data):
            addr = guest_start + i
            x, y = hilbert_d2xy(size, addr)
            offset = (y * size + x) * 4
            # Write 32-bit value as RGBA
            texture[offset + 0] = (val >> 0) & 0xFF
            texture[offset + 1] = (val >> 8) & 0xFF
            texture[offset + 2] = (val >> 16) & 0xFF
            texture[offset + 3] = (val >> 24) & 0xFF

    return bytes(texture)

def load_alpine_kernel(path):
    """Load Alpine kernel from .rts.png file."""
    img = Image.open(path)
    if img.mode != 'RGBA':
        img = img.convert('RGBA')

    size = img.size[0]  # Assume square
    pixels = list(img.getdata())

    # Convert RGBA pixels to 32-bit values using Hilbert addressing
    data = []
    for i, pixel in enumerate(pixels):
        r, g, b, a = pixel[:4]
        val = r | (g << 8) | (b << 16) | (a << 24)
        data.append(val)

    return data

def main():
    print("=" * 60)
    print("Geometry OS - Alpine Substrate Builder")
    print("=" * 60)

    # Paths
    glyph_path = project_root / "systems" / "glyph_stratum" / "programs" / "riscv_mini.glyph"
    alpine_path = project_root / "alpine.rts.png"
    output_path = project_root / "alpine_emulated.rts.png"

    print(f"\nGlyph emulator: {glyph_path}")
    print(f"Alpine kernel: {alpine_path}")
    print(f"Output: {output_path}")

    # Check files exist
    if not glyph_path.exists():
        print(f"ERROR: Glyph file not found: {glyph_path}")
        return 1
    if not alpine_path.exists():
        print(f"ERROR: Alpine kernel not found: {alpine_path}")
        return 1

    # Compile glyph program
    print("\n[1/3] Compiling RISC-V emulator...")
    with open(glyph_path) as f:
        source = f.read()
    instructions = compile_glyph_program(source)
    print(f"  Compiled {len(instructions)} instructions")

    # Load Alpine kernel
    print("\n[2/3] Loading Alpine kernel...")
    guest_data = load_alpine_kernel(alpine_path)
    print(f"  Loaded {len(guest_data)} words of guest memory")

    # Create combined substrate
    print("\n[3/3] Creating combined substrate...")
    texture_data = create_substrate_texture(instructions, guest_data, size=4096)

    # Save as PNG
    img = Image.frombytes('RGBA', (4096, 4096), texture_data)
    img.save(output_path)
    print(f"  Saved to {output_path}")

    # Verify memory layout
    print("\nMemory Layout:")
    print(f"  0x00000: Emulator code ({len(instructions)} instructions)")
    print(f"  0x14000: Guest PC")
    print(f"  0x14100: Guest registers")
    print(f"  0x18000: Guest RAM (Alpine kernel)")

    print("\nDone! Run with:")
    print(f"  cargo run --bin glyph_vm_boot -- {output_path}")

    return 0

if __name__ == '__main__':
    sys.exit(main())
