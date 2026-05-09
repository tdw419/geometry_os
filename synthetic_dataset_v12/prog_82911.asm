; DESCRIPTION: Creates a purple circular shape at (204, 80) with radius 13.
; PLAN: r0=204(x), r1=80(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 80
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
