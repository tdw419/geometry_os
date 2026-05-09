; DESCRIPTION: Creates a white circular shape at (297, 69) with radius 61.
; PLAN: r0=297(x), r1=69(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 69
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
