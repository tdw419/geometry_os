; DESCRIPTION: Draws a purple circle centered at (287, 119) with radius 47.
; PLAN: r0=287(x), r1=119(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 119
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
