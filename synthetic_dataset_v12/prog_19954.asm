; DESCRIPTION: Creates a white circular shape at (282, 87) with radius 35.
; PLAN: r0=282(x), r1=87(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 87
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
