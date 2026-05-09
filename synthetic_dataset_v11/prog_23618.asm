; DESCRIPTION: Draws a orange circle centered at (66, 69) with radius 44.
; PLAN: r0=66(x), r1=69(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 69
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
