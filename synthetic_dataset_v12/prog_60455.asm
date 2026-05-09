; DESCRIPTION: Draws a orange circle centered at (181, 171) with radius 75.
; PLAN: r0=181(x), r1=171(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 171
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
