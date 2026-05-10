; DESCRIPTION: Creates a white circular shape at (312, 69) with radius 64.
; PLAN: r0=312(x), r1=69(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 69
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
