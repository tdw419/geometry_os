; DESCRIPTION: Creates a white circular shape at (156, 88) with radius 73.
; PLAN: r0=156(x), r1=88(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 88
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
