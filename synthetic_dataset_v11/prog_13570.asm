; DESCRIPTION: Creates a white circular shape at (156, 172) with radius 72.
; PLAN: r0=156(x), r1=172(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 172
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
