; DESCRIPTION: Creates a purple circular shape at (138, 136) with radius 36.
; PLAN: r0=138(x), r1=136(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 136
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
