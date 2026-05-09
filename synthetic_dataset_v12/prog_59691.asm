; DESCRIPTION: Creates a orange circular shape at (382, 24) with radius 15.
; PLAN: r0=382(x), r1=24(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 24
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
