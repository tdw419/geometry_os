; DESCRIPTION: Creates a orange circular shape at (491, 226) with radius 12.
; PLAN: r0=491(x), r1=226(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 491
LDI r1, 226
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
