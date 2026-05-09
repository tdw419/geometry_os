; DESCRIPTION: Creates a white circular shape at (257, 170) with radius 49.
; PLAN: r0=257(x), r1=170(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 170
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
