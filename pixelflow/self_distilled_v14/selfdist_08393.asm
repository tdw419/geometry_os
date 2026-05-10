; DESCRIPTION: Draws a orange circle centered at (225, 114) with radius 33.
; PLAN: r0=225(x), r1=114(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 114
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
