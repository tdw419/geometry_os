# Rain animation -- simplified, 5 drops, 30 frames
# Drops at RAM 0x200+ to avoid overwriting program
frames = 0
seed = 42

# Init 5 drops: ram[0x200+i*2]=x, ram[0x200+i*2+1]=y
i = 0
while i < 5:
    t = seed * 17
    seed = (t + 5) & 0xFFFF
    x = (seed & 127) + 10
    ram[0x200 + i * 2] = x
    ram[0x200 + i * 2 + 1] = 0
    i = i + 1

while frames < 30:
    i = 0
    while i < 5:
        x = ram[0x200 + i * 2]
        y = ram[0x200 + i * 2 + 1]
        pixel(x, y, 0x3F)
        y = y + 3
        if y >= 256:
            y = 0
            t = seed * 17
            seed = (t + 5) & 0xFFFF
            x = (seed & 127) + 10
            ram[0x200 + i * 2] = x
        ram[0x200 + i * 2 + 1] = y
        i = i + 1
    frames = frames + 1

halt()
