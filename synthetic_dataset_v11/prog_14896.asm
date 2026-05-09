; DESCRIPTION: Draws a black circle centered at (77, 136) with radius 73.
; PLAN: r0=77(x), r1=136(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 136
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
