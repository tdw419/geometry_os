; DESCRIPTION: Places a orange circle of radius 69 at center (227, 156).
; PLAN: r0=227(x), r1=156(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 156
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
