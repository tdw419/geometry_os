; DESCRIPTION: Draws a purple circle centered at (201, 212) with radius 39.
; PLAN: r0=201(x), r1=212(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 212
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
