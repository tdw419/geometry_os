; DESCRIPTION: Draws a purple circle centered at (381, 145) with radius 62.
; PLAN: r0=381(x), r1=145(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 145
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
