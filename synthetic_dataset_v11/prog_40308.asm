; DESCRIPTION: Creates a orange circular shape at (154, 181) with radius 63.
; PLAN: r0=154(x), r1=181(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 181
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
