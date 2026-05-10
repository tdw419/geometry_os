; DESCRIPTION: Draws a orange circle centered at (76, 162) with radius 50.
; PLAN: r0=76(x), r1=162(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 162
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
