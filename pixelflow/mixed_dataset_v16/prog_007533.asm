; DESCRIPTION: Creates a purple circular shape at (201, 139) with radius 51.
; PLAN: r0=201(x), r1=139(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 139
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
