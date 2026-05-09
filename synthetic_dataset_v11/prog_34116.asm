; DESCRIPTION: Creates a purple circular shape at (161, 110) with radius 60.
; PLAN: r0=161(x), r1=110(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 110
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
