; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.

LDI r0, 68
LDI r1, 185
LDI r2, 80
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT