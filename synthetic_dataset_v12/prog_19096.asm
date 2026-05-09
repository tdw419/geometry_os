; DESCRIPTION: Draws a purple circle centered at (88, 101) with radius 55.
; PLAN: r0=88(x), r1=101(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 101
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
