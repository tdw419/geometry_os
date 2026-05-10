; DESCRIPTION: Draws a black circle centered at (423, 75) with radius 14.
; PLAN: r0=423(x), r1=75(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 75
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
