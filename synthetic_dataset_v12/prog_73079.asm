; DESCRIPTION: Draws a orange circle centered at (355, 89) with radius 48.
; PLAN: r0=355(x), r1=89(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 89
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
