; DESCRIPTION: Draws a purple circle centered at (486, 219) with radius 14.
; PLAN: r0=486(x), r1=219(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 219
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
