#!/usr/bin/env python3
"""
Glyph Compiler v2 — Compiles .glyph/.asm source to .rts.png spatial archives.

Opcode table sourced from the VM's disassembler (src/vm/disasm.rs).
Each instruction word is a single u32 stored in RAM.
The .rts.png stores these words as RGBA pixels: (R<<24)|(G<<16)|(B<<8)|A.

The VM's fetch() reads one u32 per PC increment.
Instructions are variable-length: opcode is word[0], operands are word[1..N].
"""
import sys, re, struct
from PIL import Image

# === Real ISA opcode table (from disasm.rs + ops_*.rs) ===
# Format: mnemonic -> (opcode_byte, operand_count)
OPCODES = {
    # Basic (ops_basic.rs)
    'HALT':    (0x00, 0),
    'NOP':     (0x01, 0),
    'FRAME':   (0x02, 0),
    'BEEP':    (0x03, 2),   # BEEP freq_reg, dur_reg

    # Memory (ops_memory.rs)
    'LDI':     (0x10, 2),   # LDI reg, imm
    'LOAD':    (0x11, 2),   # LOAD reg, [addr_reg]
    'STORE':   (0x12, 2),   # STORE [addr_reg], reg
    'TEXTI':   (0x13, -1),  # TEXTI x, y, count, chars... (variable)
    'STRO':    (0x14, -1),  # STRO addr_reg, count, chars... (variable)
    'CMPI':    (0x15, 2),   # CMPI reg, imm
    'LOADS':   (0x16, 2),   # LOADS reg, offset
    'STORES':  (0x17, 2),   # STORES offset, reg
    'PUSH':    (0x18, 1),   # PUSH reg
    'POP':     (0x19, 1),   # POP reg
    'JMP':     (0x1A, 1),   # JMP addr
    'JZ':      (0x1B, 2),   # JZ reg, addr
    'JNZ':     (0x1C, 2),   # JNZ reg, addr
    'CALL':    (0x1D, 1),   # CALL addr
    'RET':     (0x1E, 0),   # RET
    'CMP':     (0x1F, 2),   # CMP reg1, reg2

    # Math (ops_math.rs) — these use 0x20-0x3A range
    'ADD':     (0x20, 3),   # ADD dst, src1, src2
    'SUB':     (0x21, 3),
    'MUL':     (0x22, 3),
    'DIV':     (0x23, 3),
    'MOD':     (0x24, 3),
    'AND':     (0x25, 3),
    'OR':      (0x26, 3),
    'XOR':     (0x27, 3),
    'NOT':     (0x28, 2),
    'SHL':     (0x29, 3),
    'SHR':     (0x2A, 3),
    'ADDI':    (0x2B, 3),   # ADDI dst, src, imm
    'SUBI':    (0x2C, 3),
    'MULI':    (0x2D, 3),
    'MOV':     (0x2E, 2),   # MOV dst, src
    'BLT':     (0x2F, 3),   # BLT reg, reg, addr
    'BGT':     (0x30, 3),
    'BLE':     (0x31, 3),
    'BGE':     (0x32, 3),
    'BEQ':     (0x33, 3),
    'BNE':     (0x34, 3),

    # Spatial (ops_graphics.rs)
    'HILBERT_XY2D': (0x3B, 3),  # HILBERT_XY2D dst, x, y
    'HILBERT_D2XY': (0x3C, 3),  # HILBERT_D2XY x, y, d
    'NEURAL_EVAL':  (0x3D, 3),  # NEURAL_EVAL dst, in1, in2

    # Graphics (ops_graphics.rs)
    'PSET':    (0x40, 3),   # PSET x, y, color
    'PRECT':   (0x41, 1),
    'FRECT':   (0x42, 1),
    'LINE':    (0x43, 1),
    'RECTF':   (0x44, 5),   # RECTF x, y, w, h, color
    'ELLIPSE': (0x45, 5),
    'PIXEL':   (0x46, 3),
    'CLIP':    (0x47, 4),
    'TEXT':    (0x48, 1),
    'FONT':    (0x49, 1),
    'SPRITE':  (0x4A, 1),
    'FRAME':   (0x4B, 1),
    'MOUSEQ':  (0x4D, 1),
    'KEYQ':    (0x4E, 1),
    'KEYWAIT': (0x4F, 1),
}

REGISTERS = {f'r{i}': i for i in range(32)}

def d2xy(n, d):
    """Hilbert curve: convert 1D index d to 2D (x,y) in n×n space."""
    x, y, t, s = 0, 0, d, 1
    while s < n:
        rx = 1 & (t // 2)
        ry = 1 & (t ^ rx)
        if ry == 0:
            if rx == 1:
                x, y = s - 1 - x, s - 1 - y
            x, y = y, x
        x += s * rx
        y += s * ry
        t //= 4
        s *= 2
    return x, y

def parse_operand(tok):
    """Parse a single operand: register name or numeric literal."""
    tok = tok.strip().rstrip(',')
    if tok in REGISTERS:
        return REGISTERS[tok]
    return int(tok, 0) & 0xFFFFFFFF

def compile_glyph(source):
    """Compile .glyph source to a list of u32 words (big-endian per word)."""
    words = []
    for raw_line in source.split('\n'):
        line = raw_line.split(';')[0].strip()
        if not line:
            continue
        parts = re.split(r'[\s,]+', line)
        mnemonic = parts[0].upper()

        # Handle raw data directives
        if mnemonic == 'DB' or mnemonic == '.DB' or mnemonic == '.BYTE':
            for p in parts[1:]:
                val = int(p, 0) & 0xFFFFFFFF
                words.append(val)
            continue

        # Handle labels (skip them, they're informational in .glyph)
        if mnemonic.endswith(':'):
            continue

        if mnemonic not in OPCODES:
            # Try as raw hex/decimal literal
            try:
                words.append(int(parts[0], 0) & 0xFFFFFFFF)
                continue
            except ValueError:
                print(f"WARNING: Unknown mnemonic '{mnemonic}'", file=sys.stderr)
                continue

        opcode, nargs = OPCODES[mnemonic]
        operands = [parse_operand(p) for p in parts[1:] if p]

        if nargs == -1:
            # Variable-length instruction (TEXTI, STRO)
            words.append(opcode)
            for op in operands:
                words.append(op)
        else:
            words.append(opcode)
            for op in operands[:nargs]:
                words.append(op)

    return words

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} input.glyph output.rts.png", file=sys.stderr)
        sys.exit(1)

    with open(sys.argv[1], 'r') as f:
        bc = compile_glyph(f.read())

    if not bc:
        print("ERROR: No bytecode generated", file=sys.stderr)
        sys.exit(1)

    # Write .rts.png: first pixel = word count, then each word as RGBA pixel (linear order)
    img = Image.new('RGBA', (256, 256), (0, 0, 0, 0))
    # Header pixel: word count
    count = len(bc)
    img.putpixel((0, 0), ((count >> 24) & 0xFF, (count >> 16) & 0xFF, (count >> 8) & 0xFF, count & 0xFF))
    for i, word in enumerate(bc):
        x, y = d2xy(256, i)
        # Offset by 1 for header pixel
        px = 1 + i
        if px >= 256 * 256:
            break
        x = px % 256
        y = px // 256
        r = (word >> 24) & 0xFF
        g = (word >> 16) & 0xFF
        b = (word >> 8) & 0xFF
        a = word & 0xFF
        img.putpixel((x, y), (r, g, b, a))

    img.save(sys.argv[2])

    # Also write raw .bin for verification
    bin_path = sys.argv[2].replace('.rts.png', '.bin').replace('.png', '.bin')
    with open(bin_path, 'wb') as f:
        for word in bc:
            f.write(struct.pack('>I', word))

    print(f"Compiled {len(bc)} words. -> {sys.argv[2]} + {bin_path}")
