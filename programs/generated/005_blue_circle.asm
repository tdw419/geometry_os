; 005_blue_circle.asm -- Blue circle at center of screen (128, 128) with radius 30

LDI r0, 128
LDI r1, 128
LDI r2, 30
LDI r3, 0x0000FF

CIRCLE r0, r1, r2, r3

HALT
