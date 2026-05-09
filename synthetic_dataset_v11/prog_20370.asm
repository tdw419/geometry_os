; DESCRIPTION: Draws a orange circle centered at (83, 133) with radius 73.
; PLAN: r0=83(x), r1=133(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 133
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
