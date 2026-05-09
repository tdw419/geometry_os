; DESCRIPTION: Draws a purple circle centered at (122, 37) with radius 36.
; PLAN: r0=122(x), r1=37(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 37
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
