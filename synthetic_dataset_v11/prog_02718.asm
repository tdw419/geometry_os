; DESCRIPTION: Draws a orange circle centered at (76, 164) with radius 75.
; PLAN: r0=76(x), r1=164(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 164
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
