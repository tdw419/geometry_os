; DESCRIPTION: Draws a orange circle centered at (212, 109) with radius 54.
; PLAN: r0=212(x), r1=109(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 109
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
