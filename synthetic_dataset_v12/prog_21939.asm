; DESCRIPTION: Draws a orange circle centered at (455, 234) with radius 22.
; PLAN: r0=455(x), r1=234(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 234
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
