; DESCRIPTION: Creates a white circular shape at (83, 88) with radius 57.
; PLAN: r0=83(x), r1=88(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 88
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
