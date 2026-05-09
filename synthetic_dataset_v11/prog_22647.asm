; DESCRIPTION: Draws a orange circle centered at (133, 162) with radius 34.
; PLAN: r0=133(x), r1=162(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 162
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
