; DESCRIPTION: Creates a purple circular shape at (144, 179) with radius 75.
; PLAN: r0=144(x), r1=179(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 179
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
