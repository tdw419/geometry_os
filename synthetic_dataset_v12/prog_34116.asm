; DESCRIPTION: Creates a purple circular shape at (289, 109) with radius 78.
; PLAN: r0=289(x), r1=109(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 109
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
