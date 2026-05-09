; DESCRIPTION: Draws a orange circle centered at (50, 227) with radius 29.
; PLAN: r0=50(x), r1=227(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 227
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
