; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.

LDI r0, 100
LDI r1, 100
LDI r2, 40
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT