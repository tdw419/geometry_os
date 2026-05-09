; DESCRIPTION: Creates a purple circular shape at (141, 118) with radius 80.
; PLAN: r0=141(x), r1=118(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 118
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
