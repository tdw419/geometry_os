#!/usr/bin/env python3
"""
Build combined substrate: RISC-V emulator + guest code

Memory layout:
  0x00000 - 0x13FFF: RISC-V emulator (glyph program)
  0x14000: Guest PC
  0x14100: Guest registers (x0-x31, each 4 bytes)
  0x18000+: Guest RAM

The substrate is a 4096x4096 RGBA8 texture addressed via Hilbert curve.
Encoding per pixel:
  R = opcode
  G = stratum
  B = p1
  A = p2
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

# ============================================================================
# Glyph VM Opcodes (matching synthetic_vram.rs CPU emulator)
# ============================================================================
OPCODES = {
    "NOP": 0,
    "LDI": 1,  # Load Immediate 32-bit (uses 2 pixels: inst + data)
    "MOV": 2,  # regs[p2] = regs[p1]
    "LOAD": 3,  # regs[p2] = memory[regs[p1]]
    "STORE": 4,  # memory[regs[p1]] = regs[p2]
    "ADD": 5,  # regs[p2] = regs[p1] + regs[p2]
    "SUB": 6,  # regs[p2] = regs[p1] - regs[p2]
    "MUL": 7,  # regs[p2] = regs[p1] * regs[p2]
    "DIV": 8,  # regs[p2] = regs[p1] / regs[p2]
    "JMP": 9,  # Jump to register address
    "BRANCH": 10,  # Conditional branch (stratum=condition type)
    "CALL": 11,  # Call subroutine
    "RET": 12,  # Return from subroutine
    "RETURN": 12,  # Alias
    "HALT": 13,  # Halt execution
    "DATA": 14,  # Data word
    "LOOP": 15,  # Loop construct
    "JAL": 16,  # Jump and link
    "AND": 128,  # Bitwise AND
    "OR": 129,  # Bitwise OR
    "XOR": 130,  # Bitwise XOR
    "SHL": 131,  # Shift left
    "SHR": 132,  # Shift right logical
    "SAR": 133,  # Shift right arithmetic
    # Pseudo-instructions (compile to real opcodes)
    "JZ": "BRANCH_EQ",  # Branch if zero -> BRANCH stratum=0
    "JNZ": "BRANCH_NE",  # Branch if not zero -> BRANCH stratum=1
    "CMP": "SUB",  # Compare -> SUB (result discarded)
}

# Branch conditions (stratum value for BRANCH instruction)
BRANCH_COND = {
    "BEQ": 0,  # v1 == v2
    "BNE": 1,  # v1 != v2
    "BLT": 2,  # v1 < v2 (signed)
    "BGE": 3,  # v1 >= v2 (signed)
    "BLTU": 4,  # v1 < v2 (unsigned)
    "BGEU": 5,  # v1 >= v2 (unsigned)
}


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


def parse_register(reg_str):
    """Parse register string like 'r10' or 'r[10]' to register number."""
    reg_str = reg_str.strip()
    if reg_str.startswith("r[") and reg_str.endswith("]"):
        return int(reg_str[2:-1])
    elif reg_str.startswith("r"):
        return int(reg_str[1:])
    else:
        raise ValueError(f"Invalid register: {reg_str}")


def parse_immediate(imm_str):
    """Parse immediate value (decimal or hex)."""
    imm_str = imm_str.strip()
    if imm_str.startswith("0x") or imm_str.startswith("0X"):
        return int(imm_str, 16)
    elif imm_str.startswith("-"):
        return int(imm_str) & 0xFFFFFFFF  # Convert to unsigned
    else:
        return int(imm_str)


def compile_glyph_program(source):
    """Compile .glyph source to texture data.

    Returns a list of (opcode, stratum, p1, p2) tuples.
    Each tuple represents one pixel in the texture.
    """
    lines = source.split("\n")
    instructions = []
    labels = {}

    # First pass: collect labels and calculate addresses
    pc = 0
    for line in lines:
        # Remove comments
        if "//" in line:
            line = line[: line.index("//")]
        if ";" in line:
            line = line[: line.index(";")]
        line = line.strip()

        if not line:
            continue

        # Check for .equ directive
        if line.startswith(".equ"):
            parts = line.split(",", 1)
            if len(parts) == 2:
                name = parts[0][4:].strip()
                value = parse_immediate(parts[1].strip())
                labels[name] = value
            continue

        # Check for label
        if line.startswith(":"):
            label_name = line[1:].strip()
            labels[label_name] = pc
            continue

        # Parse instruction to count pixels
        parts = line.replace(",", " ").split()
        if not parts:
            continue

        opcode_str = parts[0].upper()

        # LDI uses 2 pixels (instruction + data)
        if opcode_str == "LDI":
            pc += 2
        # BRANCH uses 2 pixels (instruction + offset)
        elif opcode_str in ["BRANCH", "JZ", "JNZ"] or OPCODES.get(opcode_str, 0) == 10:
            pc += 2
        else:
            pc += 1

    # Second pass: compile instructions
    pc = 0
    for line in lines:
        # Remove comments
        if "//" in line:
            line = line[: line.index("//")]
        if ";" in line:
            line = line[: line.index(";")]
        line = line.strip()

        if not line or line.startswith(":") or line.startswith(".equ"):
            continue

        # Parse instruction
        parts = line.replace(",", " ").split()
        if not parts:
            continue

        opcode_str = parts[0].upper()
        original_opcode_str = opcode_str  # Preserve original for JZ/JNZ detection

        # Handle pseudo-instructions
        actual_opcode = OPCODES.get(opcode_str, 0)
        if isinstance(actual_opcode, str):
            if actual_opcode == "BRANCH_EQ":
                # JZ -> BRANCH with stratum=0 (BEQ)
                opcode_str = "BRANCH"
                actual_opcode = OPCODES["BRANCH"]
                # Will add stratum=0 below
            elif actual_opcode == "BRANCH_NE":
                # JNZ -> BRANCH with stratum=1 (BNE)
                opcode_str = "BRANCH"
                actual_opcode = OPCODES["BRANCH"]
                # Will add stratum=1 below
            elif actual_opcode == "SUB":
                # CMP -> SUB
                opcode_str = "SUB"
                actual_opcode = OPCODES["SUB"]

        if opcode_str not in OPCODES and actual_opcode == 0:
            print(f"Warning: Unknown opcode '{opcode_str}' at PC {pc}")
            continue

        opcode = actual_opcode
        stratum = 2  # Default: LOGIC stratum
        p1 = 0
        p2 = 0

        # Parse operands based on instruction type
        if opcode_str == "LDI":
            # LDI rd, imm - uses 2 pixels
            if len(parts) >= 3:
                p1 = parse_register(parts[1])
                imm_str = parts[2]
                if imm_str in labels:
                    imm = labels[imm_str]
                else:
                    try:
                        imm = parse_immediate(imm_str)
                    except ValueError:
                        imm = 0

                # First pixel: LDI instruction
                instructions.append((opcode, stratum, p1, 0))
                pc += 1

                # Second pixel: 32-bit immediate value
                # Encode as (R, G, B, A) = (imm & 0xFF, (imm>>8)&0xFF, (imm>>16)&0xFF, (imm>>24)&0xFF)
                instructions.append(
                    (imm & 0xFF, (imm >> 8) & 0xFF, (imm >> 16) & 0xFF, (imm >> 24) & 0xFF)
                )
                pc += 1
            continue

        elif opcode_str in [
            "MOV",
            "ADD",
            "SUB",
            "MUL",
            "DIV",
            "AND",
            "OR",
            "XOR",
            "SHL",
            "SHR",
            "SAR",
        ]:
            # OP src, dst (result goes into dst)
            # synthetic_vram: regs[p2] = regs[p1] OP regs[p2]
            if len(parts) >= 3:
                p1 = parse_register(parts[1])
                p2 = parse_register(parts[2])

        elif opcode_str == "LOAD":
            # LOAD addr_reg, dst_reg
            # synthetic_vram: regs[p2] = memory[regs[p1]]
            if len(parts) >= 3:
                p1 = parse_register(parts[1])
                p2 = parse_register(parts[2])

        elif opcode_str == "STORE":
            # STORE addr_reg, src_reg
            # synthetic_vram: memory[regs[p1]] = regs[p2]
            if len(parts) >= 3:
                p1 = parse_register(parts[1])
                p2 = parse_register(parts[2])

        elif opcode_str == "JMP":
            # JMP reg - jump to address in register
            # JMP label - load address into r0 then JMP to it (2 instructions)
            if len(parts) >= 2:
                target = parts[1]
                # Check if it's a label
                if target in labels:
                    target_addr = labels[target]
                    # Generate: LDI r0, target_addr (loads into r0)
                    # Then JMP r0 (jumps to address in r0)
                    instructions.append((1, 2, 0, 0))  # LDI r0, <addr> - first pixel
                    instructions.append(
                        (
                            target_addr & 0xFF,
                            (target_addr >> 8) & 0xFF,
                            (target_addr >> 16) & 0xFF,
                            (target_addr >> 24) & 0xFF,
                        )
                    )
                    pc += 2
                    # JMP r0
                    instructions.append((9, 0, 0, 0))  # JMP r0 - register mode
                    pc += 1
                    continue
                else:
                    # Try as register
                    try:
                        p1 = parse_register(target)
                    except ValueError:
                        # Try as immediate
                        try:
                            p1 = parse_immediate(target)
                        except ValueError:
                            p1 = 0
            stratum = 0  # Register mode (any value != 2)

        elif opcode_str in ["BRANCH", "JZ", "JNZ"]:
            # BRANCH cond, rs1, rs2, offset
            # JZ rs1, label (pseudo) -> BRANCH stratum=0, rs1, r0, offset
            # JNZ rs1, label (pseudo) -> BRANCH stratum=1, rs1, r0, offset
            if len(parts) >= 2:
                # Check if it's JZ/JNZ format: JZ rs, label
                if original_opcode_str in ["JZ", "JNZ"]:
                    p1 = parse_register(parts[1])  # Condition register
                    p2 = 0  # Compare against r0 (always zero)
                    stratum = 0 if original_opcode_str == "JZ" else 1  # BEQ or BNE
                    target = parts[2] if len(parts) >= 3 else "0"
                else:
                    # Full BRANCH format: BRANCH rs1, rs2, offset
                    p1 = parse_register(parts[1])
                    p2 = parse_register(parts[2]) if len(parts) >= 3 else 0
                    stratum = 0  # Default: BEQ
                    target = parts[3] if len(parts) >= 4 else "0"

                # Calculate offset (relative to next instruction)
                if target in labels:
                    target_addr = labels[target]
                else:
                    try:
                        target_addr = parse_immediate(target)
                    except ValueError:
                        target_addr = 0

                # First pixel: BRANCH instruction
                instructions.append((opcode, stratum, p1, p2))
                pc += 1

                # Second pixel: signed offset
                offset = target_addr - (pc + 1)  # Relative to pixel after offset
                offset = offset & 0xFFFFFFFF  # Convert to unsigned
                instructions.append(
                    (
                        offset & 0xFF,
                        (offset >> 8) & 0xFF,
                        (offset >> 16) & 0xFF,
                        (offset >> 24) & 0xFF,
                    )
                )
                pc += 1
            continue

        elif opcode_str in ["CALL", "RET", "RETURN", "HALT", "NOP"]:
            # No additional operands
            pass

        instructions.append((opcode, stratum, p1, p2))
        pc += 1

    return instructions


def load_guest_data(path):
    """Load guest data from .rts.png file."""
    img = Image.open(path)
    if img.mode != "RGBA":
        img = img.convert("RGBA")

    size = img.size[0]  # Assume square
    pixels = list(img.getdata())

    # Convert RGBA pixels to 32-bit values
    data = []
    for pixel in pixels:
        r, g, b, a = pixel[:4]
        val = r | (g << 8) | (b << 16) | (a << 24)
        data.append(val)

    return data


def create_substrate_texture(instructions, guest_data=None, size=4096):
    """Create a size x size RGBA8 texture with the program and guest data."""
    texture = bytearray(size * size * 4)

    # Write instructions using Hilbert addressing
    for i, (r, g, b, a) in enumerate(instructions):
        x, y = hilbert_d2xy(size, i)
        offset = (y * size + x) * 4
        texture[offset + 0] = r & 0xFF
        texture[offset + 1] = g & 0xFF
        texture[offset + 2] = b & 0xFF
        texture[offset + 3] = a & 0xFF

    # Write guest data at address 0x18000 (98304)
    # Guest data is a bytearray - combine 4 bytes into each 32-bit pixel
    if guest_data:
        guest_start = 0x18000
        for i in range(0, len(guest_data), 4):
            # Combine 4 bytes into a 32-bit word (big-endian)
            if i + 3 < len(guest_data):
                val = (
                    (guest_data[i] << 24)
                    | (guest_data[i + 1] << 16)
                    | (guest_data[i + 2] << 8)
                    | guest_data[i + 3]
                )
            else:
                # Handle partial word at end
                val = 0
                for j in range(min(4, len(guest_data) - i)):
                    val |= guest_data[i + j] << (24 - j * 8)

            pixel_addr = guest_start + (i // 4)
            if pixel_addr >= size * size:
                break
            x, y = hilbert_d2xy(size, pixel_addr)
            offset = (y * size + x) * 4
            texture[offset + 0] = (val >> 0) & 0xFF
            texture[offset + 1] = (val >> 8) & 0xFF
            texture[offset + 2] = (val >> 16) & 0xFF
            texture[offset + 3] = (val >> 24) & 0xFF

    return bytes(texture)


def main():
    print("=" * 60)
    print("Geometry OS - Substrate Builder")
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
    print(f"  Compiled {len(instructions)} pixels")

    # Load Alpine kernel
    print("\n[2/3] Loading Alpine kernel...")
    guest_data = load_guest_data(alpine_path)
    print(f"  Loaded {len(guest_data)} words of guest memory")

    # Create combined substrate
    print("\n[3/3] Creating combined substrate...")
    texture_data = create_substrate_texture(instructions, guest_data, size=4096)

    # Save as PNG
    img = Image.frombytes("RGBA", (4096, 4096), texture_data)
    img.save(output_path)
    print(f"  Saved to {output_path}")

    # Verify memory layout
    print("\nMemory Layout:")
    print(f"  0x00000: Emulator code ({len(instructions)} pixels)")
    print(f"  0x14000: Guest PC")
    print(f"  0x14100: Guest registers")
    print(f"  0x18000: Guest RAM (Alpine kernel)")

    print("\nDone! Run with:")
    print(f"  cargo run --release --bin glyph_vm_boot -- {output_path}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
