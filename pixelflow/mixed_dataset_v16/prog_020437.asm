; DESCRIPTION: Draws a purple circle centered at (112, 88) with radius 38.
; PLAN: r0=112(x), r1=88(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 88
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
