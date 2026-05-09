; DESCRIPTION: Draws a green circle centered at (289, 104) with radius 61.
; PLAN: r0=289(x), r1=104(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 104
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
