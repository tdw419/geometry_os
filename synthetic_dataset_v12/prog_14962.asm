; DESCRIPTION: Draws a yellow circle centered at (476, 99) with radius 15.
; PLAN: r0=476(x), r1=99(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 99
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
