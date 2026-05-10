; DESCRIPTION: Draws a orange circle centered at (308, 234) with radius 18.
; PLAN: r0=308(x), r1=234(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 234
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
