; DESCRIPTION: Creates a white circular shape at (26, 66) with radius 16.
; PLAN: r0=26(x), r1=66(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 66
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
