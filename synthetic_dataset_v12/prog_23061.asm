; DESCRIPTION: Creates a red circular shape at (137, 170) with radius 62.
; PLAN: r0=137(x), r1=170(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 170
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
