; DESCRIPTION: Creates a orange circular shape at (157, 63) with radius 13.
; PLAN: r0=157(x), r1=63(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 63
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
