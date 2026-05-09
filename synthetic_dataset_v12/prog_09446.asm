; DESCRIPTION: Creates a white circular shape at (429, 170) with radius 47.
; PLAN: r0=429(x), r1=170(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 170
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
