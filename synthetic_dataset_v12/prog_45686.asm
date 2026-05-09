; DESCRIPTION: Creates a purple circular shape at (100, 110) with radius 35.
; PLAN: r0=100(x), r1=110(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 110
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
