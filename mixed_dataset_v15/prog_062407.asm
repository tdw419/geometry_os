; DESCRIPTION: Creates a white circular shape at (363, 88) with radius 61.
; PLAN: r0=363(x), r1=88(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 88
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
