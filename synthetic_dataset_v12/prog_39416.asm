; DESCRIPTION: Draws a orange circle centered at (142, 86) with radius 66.
; PLAN: r0=142(x), r1=86(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 86
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
