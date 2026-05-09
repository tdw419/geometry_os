; DESCRIPTION: Draws a purple circle centered at (459, 119) with radius 40.
; PLAN: r0=459(x), r1=119(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 119
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
