; DESCRIPTION: Draws a orange circle centered at (172, 164) with radius 76.
; PLAN: r0=172(x), r1=164(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 164
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
