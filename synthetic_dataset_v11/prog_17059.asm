; DESCRIPTION: Places a orange circle of radius 56 at center (89, 140).
; PLAN: r0=89(x), r1=140(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 140
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
