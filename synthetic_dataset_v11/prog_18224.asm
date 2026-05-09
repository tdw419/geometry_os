; DESCRIPTION: Creates a white circular shape at (136, 158) with radius 73.
; PLAN: r0=136(x), r1=158(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 158
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
