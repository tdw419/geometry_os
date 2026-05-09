; DESCRIPTION: Creates a white circular shape at (14, 105) with radius 12.
; PLAN: r0=14(x), r1=105(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 105
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
