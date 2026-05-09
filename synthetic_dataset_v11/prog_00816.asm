; DESCRIPTION: Draws a black circle centered at (137, 110) with radius 79.
; PLAN: r0=137(x), r1=110(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 110
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
