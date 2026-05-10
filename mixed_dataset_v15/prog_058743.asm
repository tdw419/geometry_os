; DESCRIPTION: Draws a orange circle centered at (234, 188) with radius 10.
; PLAN: r0=234(x), r1=188(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 188
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
