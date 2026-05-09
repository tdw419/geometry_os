; DESCRIPTION: Creates a white circular shape at (134, 66) with radius 50.
; PLAN: r0=134(x), r1=66(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 66
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
