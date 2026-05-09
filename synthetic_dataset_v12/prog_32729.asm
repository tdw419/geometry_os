; DESCRIPTION: Creates a white circular shape at (332, 122) with radius 79.
; PLAN: r0=332(x), r1=122(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 122
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
