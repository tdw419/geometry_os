; DESCRIPTION: Creates a white circular shape at (358, 148) with radius 61.
; PLAN: r0=358(x), r1=148(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 148
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
