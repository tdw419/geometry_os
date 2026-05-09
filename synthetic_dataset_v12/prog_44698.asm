; DESCRIPTION: Creates a white circular shape at (166, 66) with radius 63.
; PLAN: r0=166(x), r1=66(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 66
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
