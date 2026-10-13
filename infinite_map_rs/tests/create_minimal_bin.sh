# Minimal ECALL test - ECALL is the 4th instruction
# Setup: lui t0, 0x20000; addi sp, t0, 0; lui a7, 0x123; ecall; write flag; halt

# Hand-encoding for RISC-V:
# lui t0, 0x20000     -> 0x200002b7 (opcode LUI=0x37, rd=t0=5, imm=0x20000)
# addi sp, t0, 0      -> 0x00028293 (opcode OP_IMM=0x13, rd=sp=2, rs1=t0=5, imm=0)
# lui a7, 0x123       -> 0x00012397 (opcode LUI=0x37, rd=a7=17, imm=0x123)
# ecall               -> 0x73000000 (opcode SYSTEM=0x73, all zeros = ecall)
# lui a0, 0x3         -> 0x00000537 (opcode LUI=0x37, rd=a0=10, imm=0x3)
# sw a0, 0(a0)       -> 0x00a5a023 (opcode STORE=0x23, rs2=a0=10, rs1=a0=10, funct3=0x010, imm=0)
# halt: j halt        -> 0xfe00006f (opcode JAL=0x6f, rd=zero=0, imm=-4)

echo "200002b7 00028293 00012397 73000000 00000537 00a5a023 fe00006f" | xxd -r -p > test_minimal_ecall_hand.bin
echo "Binary:"
hexdump -C test_minimal_ecall_hand.bin
echo ""
echo "Verifying instruction at 0x1006 (ECALL):"
xxd -s 0x6 -l 4 test_minimal_ecall_hand.bin
echo ""
echo "This should be: 00 00 00 73 (little-endian)"