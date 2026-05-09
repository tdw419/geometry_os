; DESCRIPTION: Creates a orange circular shape at (396, 135) with radius 14.
; PLAN: r0=396(x), r1=135(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 135
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
