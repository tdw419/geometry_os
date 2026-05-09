; DESCRIPTION: Draws a black circle centered at (114, 88) with radius 34.
; PLAN: r0=114(x), r1=88(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 88
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
