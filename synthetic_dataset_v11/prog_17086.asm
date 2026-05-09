; DESCRIPTION: Draws a orange circle centered at (112, 109) with radius 18.
; PLAN: r0=112(x), r1=109(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 109
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
