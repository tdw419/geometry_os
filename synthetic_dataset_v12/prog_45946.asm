; DESCRIPTION: Creates a purple circular shape at (361, 86) with radius 58.
; PLAN: r0=361(x), r1=86(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 86
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
