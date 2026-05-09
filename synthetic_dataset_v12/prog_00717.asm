; DESCRIPTION: Draws a purple circle centered at (65, 88) with radius 41.
; PLAN: r0=65(x), r1=88(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 88
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
