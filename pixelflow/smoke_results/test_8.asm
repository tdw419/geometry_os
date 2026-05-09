; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.

LDI r0, 8
LDI r1, 8
LDI r2, 15
LDI r3, 1
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT