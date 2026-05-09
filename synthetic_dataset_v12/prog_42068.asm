; DESCRIPTION: Creates a orange circular shape at (375, 181) with radius 68.
; PLAN: r0=375(x), r1=181(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 181
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
