; DESCRIPTION: Creates a purple circular shape at (89, 113) with radius 74.
; PLAN: r0=89(x), r1=113(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 113
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
