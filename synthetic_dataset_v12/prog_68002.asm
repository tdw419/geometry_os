; DESCRIPTION: Creates a white circular shape at (41, 148) with radius 13.
; PLAN: r0=41(x), r1=148(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 148
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
