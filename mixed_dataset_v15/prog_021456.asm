; DESCRIPTION: Draws a black circle centered at (245, 104) with radius 39.
; PLAN: r0=245(x), r1=104(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 104
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
