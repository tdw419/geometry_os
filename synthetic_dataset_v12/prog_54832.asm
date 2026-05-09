; DESCRIPTION: Creates a white circular shape at (181, 87) with radius 66.
; PLAN: r0=181(x), r1=87(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 87
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
