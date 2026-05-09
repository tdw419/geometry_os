; DESCRIPTION: Creates a purple circular shape at (414, 62) with radius 41.
; PLAN: r0=414(x), r1=62(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 62
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
