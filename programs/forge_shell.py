import struct

# Opcode Mapping
OP_LDI = 0x49
OP_LOAD = 0x4C
OP_STORE = 0x53
OP_BRANCH = 0x42
OP_JMP = 0x4A
OP_HALT = 0x48
OP_PSET = 0x50
OP_ADD = 0x41

def assemble():
    pixels = []
    
    # --- Register Setup ---
    # r0: Keyboard Port Address (1023)
    # r1: Current Key Value
    # r2: Cursor X position on screen
    # r3: Cursor Y position on screen
    # r4: Temporary / Zero
    # r5: Color (White)
    
    pixels += [OP_LDI, 0, 1023]  # r0 = 1023
    pixels += [OP_LDI, 2, 10]    # r2 = 10 (X)
    pixels += [OP_LDI, 3, 50]    # r3 = 50 (Y)
    pixels += [OP_LDI, 4, 0]     # r4 = 0
    pixels += [OP_LDI, 5, 255]   # r5 = 255 (White)

    # --- Main Loop (Address 15) ---
    loop_addr = 15
    pixels += [OP_LOAD, 1, 0]    # r1 = RAM[r0] (Read key)
    
    # BRANCH cond, addr (cond 1 = BNE)
    # cond pixel: 1 (BNE) | (r1 << 16) | (r4 << 24)
    cond_pixel = 1 | (1 << 16) | (4 << 24)
    draw_addr = 24
    pixels += [OP_BRANCH, cond_pixel, draw_addr] # If r1 != 0, goto draw
    
    pixels += [OP_JMP, loop_addr] # Else, loop

    # --- Draw Routine (Address 24) ---
    # Draw key color at cursor
    pixels += [OP_PSET, 2, 3, 5]  # PSET x=r2, y=r3, color=r5 (white)
    
    # Advance Cursor X
    pixels += [OP_LDI, 6, 2]      # r6 = 2
    pixels += [OP_ADD, 2, 6]      # r2 += 2
    
    # Clear Keyboard Port (ACK)
    pixels += [OP_STORE, 0, 4]    # RAM[r0] = r4 (0)
    
    pixels += [OP_JMP, loop_addr] # Back to loop

    # --- Padding ---
    while len(pixels) < 1024:
        pixels.append(0)

    with open("programs/shell.rts", "wb") as f:
        for p in pixels:
            f.write(struct.pack("<I", p))

    print(f"Assembled GEOS Shell to programs/shell.rts")

if __name__ == "__main__":
    assemble()
