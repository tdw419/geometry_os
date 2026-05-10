; DESCRIPTION: Creates a black circular shape at (258, 176) with radius 52.
; PLAN: r0=258(x), r1=176(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 176
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
