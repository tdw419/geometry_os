; DESCRIPTION: Creates a purple circular shape at (204, 60) with radius 11.
; PLAN: r0=204(x), r1=60(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 60
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
