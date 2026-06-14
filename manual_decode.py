def sign_extend(val, bits):
    sign_bit = 1 << (bits - 1)
    return (val & (sign_bit - 1)) - (val & sign_bit)

# 0x27b7a680 (PC 0xC0401000)
# Word 0xb9372097 (PC 0xC0401008)
# Opcode for 0xb9372097: 0x17 (AUIPC)
# rd = 1 (ra)
# imm = 0xb9372000 (sign-extended)
# This AUIPC rd, imm means ra = PC + 0xb9372000.
# If PC = 0xC0401008, then ra = 0xC0401008 + 0xb9372000 = 0x79773008.
# 
# Wait, let's look at 0x27b7a680 again.
# If 0xa680 is illegal, we hit trap.
# Trap handler is at mtvec?
# The log says S->M TRAP: PC was=0xC0401000 now=0x80000000.
# This means mtvec must be 0x80000000.
# But 0x80000000 is the MZ/EFI stub at the start of Segment 0!
# MZ header: 0x5a4d 0x106f.
# 0x5a4d (c.li s4, -13)
# 0x106f (c.j -1878)
# Jump -1878 from 0x80000002 -> 0x80000002 - 1878 = 0x7FFFF8AE (outside RAM).
# 
# NO!
# The trap handler (mtvec) is set to 0x80000000.
# PC jumps to 0x80000000.
# Fetch 0x5a4d -> OK.
# Fetch 0x106f -> Jump -1878 -> PC goes to 0x7FFFF8AE.
# PC 0x7FFFF8AE is outside RAM (base 0x80000000).
# FETCH FAULT at 0x7FFFF8AE.
# deliver_trap(FETCH_FAULT, 0x7FFFF8AE) -> PC jumps back to mtvec (0x80000000).
# LOOP!
