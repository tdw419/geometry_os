; DESCRIPTION: Draws a orange circle centered at (108, 162) with radius 76.
; PLAN: r0=108(x), r1=162(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 162
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
