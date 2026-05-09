; DESCRIPTION: Creates a white circular shape at (187, 61) with radius 24.
; PLAN: r0=187(x), r1=61(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 61
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
