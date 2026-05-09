; DESCRIPTION: Creates a purple circular shape at (222, 100) with radius 74.
; PLAN: r0=222(x), r1=100(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 100
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
