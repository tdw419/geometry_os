; DESCRIPTION: Draws a orange circle centered at (144, 134) with radius 44.
; PLAN: r0=144(x), r1=134(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 134
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
