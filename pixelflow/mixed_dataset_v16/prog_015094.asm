; DESCRIPTION: Draws a orange circle centered at (70, 122) with radius 63.
; PLAN: r0=70(x), r1=122(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 122
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
