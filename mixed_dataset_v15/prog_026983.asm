; DESCRIPTION: Creates a purple circular shape at (325, 155) with radius 78.
; PLAN: r0=325(x), r1=155(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 155
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
