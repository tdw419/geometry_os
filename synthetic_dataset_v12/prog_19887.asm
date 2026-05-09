; DESCRIPTION: Creates a orange circular shape at (149, 174) with radius 63.
; PLAN: r0=149(x), r1=174(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 174
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
