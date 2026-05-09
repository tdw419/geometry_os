; DESCRIPTION: Draws a purple circle centered at (314, 76) with radius 54.
; PLAN: r0=314(x), r1=76(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 76
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
