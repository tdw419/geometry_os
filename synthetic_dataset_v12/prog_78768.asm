; DESCRIPTION: Creates a white circular shape at (299, 96) with radius 31.
; PLAN: r0=299(x), r1=96(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 96
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
