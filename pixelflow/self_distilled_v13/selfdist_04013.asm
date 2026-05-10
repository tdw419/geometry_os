; DESCRIPTION: Draws a orange circle centered at (38, 51) with radius 70.
; PLAN: r0=38(x), r1=51(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 51
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
