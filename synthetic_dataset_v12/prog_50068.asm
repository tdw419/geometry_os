; DESCRIPTION: Draws a purple circle centered at (324, 66) with radius 47.
; PLAN: r0=324(x), r1=66(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 66
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
