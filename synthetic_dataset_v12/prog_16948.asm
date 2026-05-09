; DESCRIPTION: Draws a purple circle centered at (430, 145) with radius 40.
; PLAN: r0=430(x), r1=145(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 145
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
