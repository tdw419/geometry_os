import struct

# Opcodes
OP_LDI = 0x49
OP_ISSUE = 0x63
OP_HALT = 0x48

def forge():
    pixels = []
    
    # Request a Font update from the external geo-forge
    # r0 = 'F' (Font)
    # r1 = 'A' (All)
    # r2 = 3 (Critical Priority)
    
    pixels += [OP_LDI, 0, ord('F')]
    pixels += [OP_LDI, 1, ord('A')]
    pixels += [OP_LDI, 2, 3]
    pixels += [OP_ISSUE] # Opcode 'c'
    
    pixels += [OP_HALT]
    
    while len(pixels) < 1024:
        pixels.append(0)

    with open("programs/request.rts", "wb") as f:
        for p in pixels:
            f.write(struct.pack("<I", p))
    print("Forge Request Demo assembled to programs/request.rts")

if __name__ == "__main__":
    forge()
