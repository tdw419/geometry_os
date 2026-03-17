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

# Guest program: SW instructions that store G, E, O, M to UART
# RISC-V SW format: imm[11:5] | rs2[4:0] | rs1[4:0] | funct3=2 | imm[4:0] | opcode=0x23
# For UART at 0x200, we need: SW rs2, 0x200(rs1=0)
# But rs1=0 (x0) is always 0, so we need to use a different approach
# Actually, let me just encode the instructions manually

# SW x1, 0(x0), 0x200 - but this won't work because x0=0
# Let me use a different approach: store characters in guest registers first,# then SW to UART
# For simplicity, let me just create raw instruction bytes
guest_program = bytearray()
# Instruction: Store 71 ('G') at UART[0]
# This would be: SW x?, 0x200, but we need a value in a register first
# Let me use: ADDI x1, x0, 71 -> x1 = 0 + 71 = 71
# Then: SW x1, 0(x0), 0x200
# ADDI format: imm[11:0] | rs1[4:0] | funct3=0 | rd[4:0] | opcode=0x13
# ADDI x1, x0, 71: imm=71, rs1=0, funct3=0, rd=1, opcode=0x13
addi_71_0_1 = struct.pack('>I', 0x04700013)  # imm=71, rs1=0, funct3=0, rd=1, opcode=0x13
guest_program.extend(addi_71_0_1)
# SW x1, 0(x0), 0x200: imm=0x200, rs2=1, rs1=0, funct3=2, opcode=0x23
# imm[11:5]=0x10, rs2=1, rs1=0, funct3=2, imm[4:0]=0, opcode=0x23
sw_200_0_1 = struct.pack('>I', 0x0A001A3)  # 0x0A0 | 1 << 20 | 0 << 15 | 2 << 12 | 0 << 7 | 0x23
guest_program.extend(sw_200_0_1)
# ADDI x1, x0, 69 ('E')
addi_69_0_1 = struct.pack('>I', 0x04500013)  # imm=69, rs1=0, funct3=0, rd=1, opcode=0x13
guest_program.extend(addi_69_0_1)
# SW x1, 0(x0), 0x201
sw_201_0_1 = struct.pack('>I', 0x0A801A3)  # 0x0A8 | 1 << 20 | 0 << 15 | 2 << 12 | 1 << 7 | 0x23
guest_program.extend(sw_201_0_1)
# ADDI x1, x0, 79 ('O')
addi_79_0_1 = struct.pack('>I', 0x04F00013)  # imm=79, rs1=0, funct3=0, rd=1, opcode=0x13
guest_program.extend(addi_79_0_1)
# SW x1, 0(x0), 0x202
sw_202_0_1 = struct.pack('>I', 0x0B001A3)  # 0x0B0 | 1 << 20 | 0 << 15 | 2 << 12 | 2 << 7 | 0x23
guest_program.extend(sw_202_0_1)
# ADDI x1, x0, 77 ('M')
addi_77_0_1 = struct.pack('>I', 0x04D00013)  # imm=77, rs1=0, funct3=0, rd=1, opcode=0x13
guest_program.extend(addi_77_0_1)
# SW x1, 0(x0), 0x203
sw_203_0_1 = struct.pack('>I', 0x0B801A3)  # 0x0B8 | 1 << 20 | 0 << 15 | 2 << 12 | 3 << 7 | 0x23
guest_program.extend(sw_203_0_1)
# EBREAK to halt
ebreak_instr = struct.pack('>I', 0x00100073)
guest_program.extend(ebreak_instr)
print(f"Guest program: {len(guest_program)} bytes = {len(guest_program)//4} instructions")
for i in range(len(guest_program)//4):
    instr = struct.unpack('>I', guest_program[i*4:i*4+4])[0]
    print(f"  [{i}] {instr:08x}")
# Create 64x64 texture
size = 64
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
