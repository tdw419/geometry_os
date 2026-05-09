; DESCRIPTION: Creates a purple circular shape at (94, 88) with radius 71.
; PLAN: r0=94(x), r1=88(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 88
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
