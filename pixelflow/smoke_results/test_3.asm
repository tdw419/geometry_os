; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).

LDI r0, 64
LDI r1, 0
LDI r2, 0
LDI r3, 0
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT