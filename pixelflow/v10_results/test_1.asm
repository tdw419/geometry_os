; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.

LDI r0, 128
LDI r1, 128
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT