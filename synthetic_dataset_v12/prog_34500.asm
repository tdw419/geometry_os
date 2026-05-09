; DESCRIPTION: Creates a yellow circular shape at (361, 170) with radius 31.
; PLAN: r0=361(x), r1=170(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 170
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
