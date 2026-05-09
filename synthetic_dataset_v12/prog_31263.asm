; DESCRIPTION: Creates a blue circular shape at (361, 89) with radius 31.
; PLAN: r0=361(x), r1=89(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 89
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
