; DESCRIPTION: Draws a purple circle centered at (71, 88) with radius 62.
; PLAN: r0=71(x), r1=88(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 88
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
