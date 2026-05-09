; DESCRIPTION: Creates a purple circular shape at (471, 87) with radius 38.
; PLAN: r0=471(x), r1=87(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 87
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
