; DESCRIPTION: Draws a orange circle centered at (79, 109) with radius 73.
; PLAN: r0=79(x), r1=109(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 109
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
