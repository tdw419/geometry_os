; DESCRIPTION: Draws a black circle centered at (212, 104) with radius 33.
; PLAN: r0=212(x), r1=104(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 104
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
