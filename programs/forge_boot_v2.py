import struct

# Opcodes
OP_LDI = 0x49
OP_ADD = 0x41
OP_MOV = 0x4D
OP_AND = 0x61
OP_MOD = 0x62
OP_DIV = 0x44
OP_SHR = 0x6B
OP_PSET = 0x50
OP_SUB = 0x55
OP_BRANCH = 0x42
OP_JMP = 0x4A
OP_CALL = 0x43
OP_HALT = 0x48
OP_RECTF = 0x46
OP_LOAD = 0x4C
OP_RET = 0x52

# Condition Codes for BRANCH
COND_BNE = 1

def forge():
    ram = [0] * 1024
    
    # --- Part 1: Font Atlas (Row 10, Address 320) ---
    with open("programs/font_atlas.rts", "rb") as f:
        atlas_data = f.read()
        atlas_pixels = struct.unpack(f"<{len(atlas_data)//4}I", atlas_data)
        for i, p in enumerate(atlas_pixels):
            if p != 0: ram[i] = p

    # --- Part 2: DRAW_CHAR Service (Row 4, Address 128) ---
    # Inputs: r1=Char, r2=X, r3=Y, r5=Color
    # Uses: r6-r15
    srv = 128
    code = []
    # :draw_char
    code += [OP_LDI, 6, 320]
    code += [OP_ADD, 6, 1]          # r6 = 320 + ASCII char index
    code += [OP_LOAD, 7, 6]         # r7 = 15-bit character mask
    code += [OP_LDI, 8, 0]           # r8 = current bit index (0..14)
    code += [OP_LDI, 15, 1]          # r15 = constant 1 (for arithmetic/shifts)
    code += [OP_LDI, 14, 3]          # r14 = constant 3 (font width)
    code += [OP_LDI, 13, 15]         # r13 = bits remaining (counter)
    
    # :bit_loop
    loop_start = srv + len(code)
    code += [OP_MOV, 9, 7]
    code += [OP_AND, 9, 15]         # r9 = mask & 1
    
    # If r9 != 0 (bit is set), jump to draw_px
    draw_px_offset = 14 
    next_bit_offset = 33
    cond_px = COND_BNE | (9 << 16) | (4 << 24) # BNE r9, r4 (r4 is 0)
    code += [OP_BRANCH, cond_px, srv + len(code) + 5] 
    code += [OP_JMP, srv + len(code) + 12] # Skip to next_bit
    
    # :draw_px
    code += [OP_MOV, 10, 8]
    code += [OP_MOD, 10, 14]        # r10 = bit % 3 (X offset)
    code += [OP_MOV, 11, 8]
    code += [OP_DIV, 11, 14]        # r11 = bit / 3 (Y offset)
    code += [OP_ADD, 10, 2]         # Absolute Screen X
    code += [OP_ADD, 11, 3]         # Absolute Screen Y
    code += [OP_PSET, 10, 11, 5]    # Draw pixel with color in r5
    
    # :next_bit
    code += [OP_SHR, 7, 15]         # mask >>= 1
    code += [OP_ADD, 8, 15]         # bit_idx++
    code += [OP_SUB, 13, 15]        # bits_left--
    
    # If r13 != 0, loop
    cond_px_loop = COND_BNE | (13 << 16) | (4 << 24)
    code += [OP_BRANCH, cond_px_loop, loop_start]
    code += [OP_RET]
    
    for i, p in enumerate(code):
        ram[srv + i] = p

    # --- Part 3: Bootloader (Row 0, Address 0) ---
    boot = 0
    bc = []
    bc += [OP_LDI, 4, 0]    # r4 = 0 (Internal constant for comparisons)
    bc += [OP_LDI, 5, 255]  # r5 = 255 (Default Text Color: White)
    
    # Fill Screen Background (Deep Navy)
    bc += [OP_LDI, 0, 20]
    bc += [OP_LDI, 1, 0]
    bc += [OP_LDI, 2, 0]
    bc += [OP_RECTF, 1, 2, 255, 255]
    
    # Taskbar (Dark Gray)
    bc += [OP_LDI, 0, 40]
    bc += [OP_LDI, 2, 240]
    bc += [OP_RECTF, 1, 2, 255, 16]
    
    # Draw "GEOS" using the Service
    chars = [ord('G'), ord('E'), ord('O'), ord('S')]
    x_pos = 10
    for c in chars:
        bc += [OP_LDI, 1, c]
        bc += [OP_LDI, 2, x_pos]
        bc += [OP_LDI, 3, 10]
        bc += [OP_CALL, 128] # CALL DRAW_CHAR service
        x_pos += 5 # Move 5 pixels right for next char
    
    bc += [OP_HALT]
    
    for i, p in enumerate(bc):
        ram[boot + i] = p

    with open("programs/boot_v2.rts", "wb") as f:
        for p in ram:
            f.write(struct.pack("<I", p))
    print("GEOS v2.0 Firmware Image forged at programs/boot_v2.rts")

if __name__ == "__main__":
    forge()
