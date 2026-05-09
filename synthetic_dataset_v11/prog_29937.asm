; DESCRIPTION: Creates a white circular shape at (87, 183) with radius 38.
; PLAN: r0=87(x), r1=183(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 183
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
