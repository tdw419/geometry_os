; DESCRIPTION: Draws a purple circle centered at (390, 172) with radius 25.
; PLAN: r0=390(x), r1=172(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 172
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
