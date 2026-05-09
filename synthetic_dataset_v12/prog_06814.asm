; DESCRIPTION: Draws a black circle centered at (155, 110) with radius 21.
; PLAN: r0=155(x), r1=110(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 110
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
