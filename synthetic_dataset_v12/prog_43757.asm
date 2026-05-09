; DESCRIPTION: Creates a purple circular shape at (399, 118) with radius 73.
; PLAN: r0=399(x), r1=118(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 118
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
