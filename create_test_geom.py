#!/usr/bin/env python3
"""Create a simple RISC-V test program that outputs GEOM via UART"""
import struct
import sys
import subprocess
sys.path.insert(0, 'scripts')
from build_alpine_substrate import compile_glyph_program, create_substrate_texture
from PIL import Image

# Load glyph emulator
with open('riscv_test_geom.glyph') as f:
    glyph_source = f.read()
emulator_instructions = compile_glyph_program(glyph_source)
print(f"Emulator: {len(emulator_instructions)} pixels")

# Guest program: LUI + ADDI to get UART address, then ADDI + SW for each character
#
# RISC-V instruction formats (little-endian in memory, but we encode as big-endian 32-bit):
# LUI format: imm[31:12] | rd[4:0] | opcode=0x37
# ADDI format: imm[11:0] | rs1[4:0] | funct3=0 | rd[4:0] | opcode=0x13
# SW format: imm[11:5] | rs2[4:0] | rs1[4:0] | funct3=2 | imm[4:0] | opcode=0x23

def encode_addi(rd, rs1, imm):
    """Encode ADDI rd, rs1, imm"""
    imm = imm & 0xFFF  # 12-bit signed immediate
    instr = (imm << 20) | (rs1 << 15) | (0 << 12) | (rd << 7) | 0x13
    return struct.pack('>I', instr)

def encode_sw(rs2, rs1, imm):
    """Encode SW rs2, imm(rs1)"""
    imm = imm & 0xFFF  # 12-bit signed immediate
    imm_11_5 = (imm >> 5) & 0x7F
    imm_4_0 = imm & 0x1F
    instr = (imm_11_5 << 25) | (rs2 << 20) | (rs1 << 15) | (2 << 12) | (imm_4_0 << 7) | 0x23
    return struct.pack('>I', instr)

def encode_lui(rd, imm):
    """Encode LUI rd, imm (imm is upper 20 bits)"""
    instr = (imm << 12) | (rd << 7) | 0x37
    return struct.pack('>I', instr)

def encode_ebreak():
    """Encode EBREAK"""
    return struct.pack('>I', 0x00100073)

guest_program = bytearray()

# x1 = UART address (0x200)
# LUI x1, 0 -> x1 = 0
guest_program.extend(encode_lui(1, 0))
# ADDI x1, x1, 0x200 -> x1 = 0x200
guest_program.extend(encode_addi(1, 1, 0x200))

# Store 'G' (71) to UART[0]
# ADDI x2, x0, 71 -> x2 = 'G'
guest_program.extend(encode_addi(2, 0, 71))
# SW x2, 0(x1) -> mem[x1+0] = x2
guest_program.extend(encode_sw(2, 1, 0))

# Store 'E' (69) to UART[4]
guest_program.extend(encode_addi(2, 0, 69))
guest_program.extend(encode_sw(2, 1, 4))

# Store 'O' (79) to UART[8]
guest_program.extend(encode_addi(2, 0, 79))
guest_program.extend(encode_sw(2, 1, 8))

# Store 'M' (77) to UART[12]
guest_program.extend(encode_addi(2, 0, 77))
guest_program.extend(encode_sw(2, 1, 12))

# EBREAK to halt
guest_program.extend(encode_ebreak())

print(f"Guest program: {len(guest_program)} bytes = {len(guest_program)//4} instructions")
for i in range(len(guest_program)//4):
    instr = struct.unpack('>I', guest_program[i*4:i*4+4])[0]
    print(f"  [{i}] {instr:08x}")
# Create 512x512 texture (262144 pixels, enough for address 0x18000)
size = 512
texture_data = create_substrate_texture(emulator_instructions, list(guest_program), size=size)
img = Image.frombytes('RGBA', (size, size), texture_data)
img.save('test_riscv_geom.rts.png')
print(f"Saved to test_riscv_geom.rts.png")
# Run on CPU emulator
print("\nRunning CPU emulator...")
result = subprocess.run(
    ['./target/release/run_glyph_cpu', 'test_riscv_geom.rts.png'],
    capture_output=True,
    text=True
)
print(result.stdout)
print(result.stderr)
