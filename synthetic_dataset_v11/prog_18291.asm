; DESCRIPTION: Draws a purple circle centered at (110, 100) with radius 58.
; PLAN: r0=110(x), r1=100(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 100
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
