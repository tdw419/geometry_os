; DESCRIPTION: Draws a orange circle centered at (82, 55) with radius 34.
; PLAN: r0=82(x), r1=55(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 55
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
