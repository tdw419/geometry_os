; DESCRIPTION: Draws a orange circle centered at (308, 161) with radius 76.
; PLAN: r0=308(x), r1=161(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 161
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
