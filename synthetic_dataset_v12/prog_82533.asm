; DESCRIPTION: Creates a purple circular shape at (261, 119) with radius 63.
; PLAN: r0=261(x), r1=119(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 119
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
