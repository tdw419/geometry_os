; DESCRIPTION: Draws a purple circle centered at (334, 89) with radius 72.
; PLAN: r0=334(x), r1=89(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 89
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
