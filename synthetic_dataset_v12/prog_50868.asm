; DESCRIPTION: Draws a orange circle centered at (227, 39) with radius 16.
; PLAN: r0=227(x), r1=39(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 39
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
