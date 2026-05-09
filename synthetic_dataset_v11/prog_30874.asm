; DESCRIPTION: Creates a purple circular shape at (158, 210) with radius 45.
; PLAN: r0=158(x), r1=210(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 210
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
