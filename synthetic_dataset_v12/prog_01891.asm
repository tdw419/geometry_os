; DESCRIPTION: Creates a white circular shape at (88, 113) with radius 76.
; PLAN: r0=88(x), r1=113(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 113
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
