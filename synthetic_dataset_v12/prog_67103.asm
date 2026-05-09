; DESCRIPTION: Creates a white circular shape at (339, 23) with radius 13.
; PLAN: r0=339(x), r1=23(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 23
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
