; DESCRIPTION: Creates a purple circular shape at (53, 77) with radius 52.
; PLAN: r0=53(x), r1=77(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 77
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
