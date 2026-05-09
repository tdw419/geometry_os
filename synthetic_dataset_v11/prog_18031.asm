; DESCRIPTION: Creates a white circular shape at (140, 72) with radius 29.
; PLAN: r0=140(x), r1=72(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 72
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
