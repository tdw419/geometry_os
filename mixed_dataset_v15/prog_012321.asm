; DESCRIPTION: Draws a orange circle centered at (246, 134) with radius 65.
; PLAN: r0=246(x), r1=134(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 134
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
