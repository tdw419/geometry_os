; DESCRIPTION: Creates a white circular shape at (134, 138) with radius 78.
; PLAN: r0=134(x), r1=138(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 138
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
