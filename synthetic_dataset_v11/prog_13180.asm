; DESCRIPTION: Creates a purple circular shape at (135, 78) with radius 75.
; PLAN: r0=135(x), r1=78(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 78
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
