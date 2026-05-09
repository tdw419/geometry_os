; DESCRIPTION: Creates a white circular shape at (187, 158) with radius 30.
; PLAN: r0=187(x), r1=158(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 158
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
