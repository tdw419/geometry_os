; DESCRIPTION: Creates a orange circular shape at (76, 136) with radius 15.
; PLAN: r0=76(x), r1=136(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 136
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
