; DESCRIPTION: Creates a white circular shape at (276, 103) with radius 49.
; PLAN: r0=276(x), r1=103(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 103
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
