; DESCRIPTION: Draws a black circle centered at (62, 96) with radius 28.
; PLAN: r0=62(x), r1=96(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 96
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
