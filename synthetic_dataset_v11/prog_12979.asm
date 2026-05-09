; DESCRIPTION: Places a orange circle of radius 19 at center (47, 140).
; PLAN: r0=47(x), r1=140(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 140
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
