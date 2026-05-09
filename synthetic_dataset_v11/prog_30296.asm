; DESCRIPTION: Creates a orange circular shape at (71, 136) with radius 14.
; PLAN: r0=71(x), r1=136(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 136
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
