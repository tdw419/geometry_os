; DESCRIPTION: Creates a white circular shape at (381, 167) with radius 38.
; PLAN: r0=381(x), r1=167(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 167
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
