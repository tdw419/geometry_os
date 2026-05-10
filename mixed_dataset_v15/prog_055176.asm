; DESCRIPTION: Creates a white circular shape at (276, 87) with radius 76.
; PLAN: r0=276(x), r1=87(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 87
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
