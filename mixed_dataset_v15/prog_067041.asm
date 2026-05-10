; DESCRIPTION: Draws a purple circle centered at (88, 176) with radius 71.
; PLAN: r0=88(x), r1=176(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 176
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
