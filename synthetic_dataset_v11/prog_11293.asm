; DESCRIPTION: Creates a orange circular shape at (170, 184) with radius 60.
; PLAN: r0=170(x), r1=184(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 184
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
