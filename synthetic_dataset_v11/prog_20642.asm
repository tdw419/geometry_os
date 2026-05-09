; DESCRIPTION: Creates a purple circular shape at (84, 179) with radius 36.
; PLAN: r0=84(x), r1=179(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 179
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
