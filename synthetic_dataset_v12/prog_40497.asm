; DESCRIPTION: Draws a orange circle centered at (212, 206) with radius 33.
; PLAN: r0=212(x), r1=206(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 206
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
