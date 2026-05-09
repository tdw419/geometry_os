; DESCRIPTION: Creates a white circular shape at (491, 156) with radius 16.
; PLAN: r0=491(x), r1=156(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 491
LDI r1, 156
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
