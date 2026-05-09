; DESCRIPTION: Draws a orange circle centered at (89, 118) with radius 37.
; PLAN: r0=89(x), r1=118(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 118
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
