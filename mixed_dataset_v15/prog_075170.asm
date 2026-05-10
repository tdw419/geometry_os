; DESCRIPTION: Creates a green circular shape at (376, 170) with radius 67.
; PLAN: r0=376(x), r1=170(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 170
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
