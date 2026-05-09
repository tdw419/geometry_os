; DESCRIPTION: Draws a orange circle centered at (132, 170) with radius 70.
; PLAN: r0=132(x), r1=170(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 170
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
