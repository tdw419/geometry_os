; DESCRIPTION: Draws a black circle centered at (319, 136) with radius 30.
; PLAN: r0=319(x), r1=136(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 136
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
