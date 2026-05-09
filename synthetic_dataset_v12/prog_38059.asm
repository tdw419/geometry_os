; DESCRIPTION: Creates a orange circular shape at (123, 188) with radius 49.
; PLAN: r0=123(x), r1=188(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 188
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
