; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.

LDI r0, 8
LDI r1, 89
LDI r2, 25
LDI r3, 1
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT