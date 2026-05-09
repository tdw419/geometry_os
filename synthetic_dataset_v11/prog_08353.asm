; DESCRIPTION: Creates a white circular shape at (76, 66) with radius 49.
; PLAN: r0=76(x), r1=66(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 66
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
