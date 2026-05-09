; DESCRIPTION: Draws a orange circle centered at (101, 119) with radius 72.
; PLAN: r0=101(x), r1=119(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 119
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
