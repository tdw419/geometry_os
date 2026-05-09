; DESCRIPTION: Creates a purple circular shape at (89, 142) with radius 75.
; PLAN: r0=89(x), r1=142(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 142
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
