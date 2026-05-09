; DESCRIPTION: Creates a orange circular shape at (117, 76) with radius 29.
; PLAN: r0=117(x), r1=76(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 76
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
