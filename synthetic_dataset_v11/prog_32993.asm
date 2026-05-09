; DESCRIPTION: Creates a purple circular shape at (134, 140) with radius 52.
; PLAN: r0=134(x), r1=140(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 140
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
