; DESCRIPTION: Creates a white circular shape at (469, 34) with radius 18.
; PLAN: r0=469(x), r1=34(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 34
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
