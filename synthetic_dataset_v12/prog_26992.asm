; DESCRIPTION: Creates a purple circular shape at (334, 77) with radius 75.
; PLAN: r0=334(x), r1=77(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 77
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
