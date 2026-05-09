; DESCRIPTION: Draws a orange circle centered at (161, 162) with radius 57.
; PLAN: r0=161(x), r1=162(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 162
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
