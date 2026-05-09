; DESCRIPTION: Creates a white circular shape at (30, 88) with radius 14.
; PLAN: r0=30(x), r1=88(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 88
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
