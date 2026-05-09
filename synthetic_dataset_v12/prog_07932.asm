; DESCRIPTION: Draws a purple circle centered at (287, 112) with radius 78.
; PLAN: r0=287(x), r1=112(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 112
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
