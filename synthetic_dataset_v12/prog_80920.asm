; DESCRIPTION: Draws a orange circle centered at (143, 71) with radius 35.
; PLAN: r0=143(x), r1=71(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 71
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
