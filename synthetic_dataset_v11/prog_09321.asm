; DESCRIPTION: Creates a orange circular shape at (86, 63) with radius 63.
; PLAN: r0=86(x), r1=63(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 63
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
