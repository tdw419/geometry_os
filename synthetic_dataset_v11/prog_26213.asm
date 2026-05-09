; DESCRIPTION: Places a orange circle of radius 11 at center (49, 140).
; PLAN: r0=49(x), r1=140(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 140
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
