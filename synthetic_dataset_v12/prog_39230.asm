; DESCRIPTION: Creates a white circular shape at (339, 134) with radius 78.
; PLAN: r0=339(x), r1=134(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 134
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
