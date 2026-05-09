; DESCRIPTION: Draws a green circle centered at (476, 175) with radius 13.
; PLAN: r0=476(x), r1=175(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 175
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
