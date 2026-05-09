; DESCRIPTION: Draws a black circle centered at (476, 35) with radius 31.
; PLAN: r0=476(x), r1=35(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 35
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
