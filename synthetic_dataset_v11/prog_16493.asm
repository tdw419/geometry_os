; DESCRIPTION: Draws a orange circle centered at (153, 148) with radius 75.
; PLAN: r0=153(x), r1=148(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 148
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
