; DESCRIPTION: Creates a purple circular shape at (253, 81) with radius 31.
; PLAN: r0=253(x), r1=81(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 81
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
