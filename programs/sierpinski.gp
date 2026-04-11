# Sierpinski triangle via chaos game
# Plots 5000 points by jumping halfway to random corners
# Corners: (10,10), (246,10), (128,246)
# Colors per corner: red(0x41), green(0xE0), blue(0x1F)

x = 128
y = 128
seed = 42
i = 0

while i < 5000:
    # Simple LCG PRNG (stays in u32 range, no overflow)
    t = seed * 17
    seed = (t + 5) & 0xFFFF
    corner = seed % 3

    # Select corner coordinates and color
    if corner == 0:
        cx = 10
        cy = 10
        color = 0x41
    else:
        if corner == 1:
            cx = 246
            cy = 10
            color = 0xE0
        else:
            cx = 128
            cy = 246
            color = 0x1F

    # Move halfway to chosen corner (>> 1 instead of / 2)
    x = (x + cx) >> 1
    y = (y + cy) >> 1

    # Plot the pixel
    pixel(x, y, color)
    i = i + 1

halt()
