; DESCRIPTION: Draws a orange circle centered at (106, 187) with radius 34.
; PLAN: r0=106(x), r1=187(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 187
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
