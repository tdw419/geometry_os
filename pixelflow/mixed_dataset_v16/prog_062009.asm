; DESCRIPTION: Creates a purple circular shape at (49, 201) with radius 24.
; PLAN: r0=49(x), r1=201(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 201
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
