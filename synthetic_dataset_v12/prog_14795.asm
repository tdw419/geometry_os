; DESCRIPTION: Creates a purple circular shape at (304, 62) with radius 52.
; PLAN: r0=304(x), r1=62(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 62
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
