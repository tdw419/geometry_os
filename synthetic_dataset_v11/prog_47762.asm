; DESCRIPTION: Draws a orange circle centered at (140, 193) with radius 17.
; PLAN: r0=140(x), r1=193(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 193
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
