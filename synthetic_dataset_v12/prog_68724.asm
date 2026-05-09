; DESCRIPTION: Creates a black circular shape at (376, 170) with radius 63.
; PLAN: r0=376(x), r1=170(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 170
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
