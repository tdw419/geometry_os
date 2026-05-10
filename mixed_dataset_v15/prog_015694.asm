; DESCRIPTION: Creates a purple circular shape at (122, 200) with radius 31.
; PLAN: r0=122(x), r1=200(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 200
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
