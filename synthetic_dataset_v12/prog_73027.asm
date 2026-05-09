; DESCRIPTION: Creates a white circular shape at (417, 170) with radius 62.
; PLAN: r0=417(x), r1=170(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 170
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
