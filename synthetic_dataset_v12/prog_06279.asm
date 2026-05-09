; DESCRIPTION: Creates a purple circular shape at (336, 78) with radius 62.
; PLAN: r0=336(x), r1=78(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 78
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
