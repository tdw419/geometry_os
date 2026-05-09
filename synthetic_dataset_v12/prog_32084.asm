; DESCRIPTION: Draws a orange circle centered at (188, 97) with radius 34.
; PLAN: r0=188(x), r1=97(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 97
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
