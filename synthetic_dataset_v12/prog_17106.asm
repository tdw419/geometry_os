; DESCRIPTION: Creates a purple circular shape at (355, 86) with radius 73.
; PLAN: r0=355(x), r1=86(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 86
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
