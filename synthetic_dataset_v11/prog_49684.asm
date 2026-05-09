; DESCRIPTION: Creates a white circular shape at (143, 227) with radius 23.
; PLAN: r0=143(x), r1=227(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 227
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
