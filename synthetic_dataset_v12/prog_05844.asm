; DESCRIPTION: Draws a orange circle centered at (55, 168) with radius 51.
; PLAN: r0=55(x), r1=168(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 168
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
