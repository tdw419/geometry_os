; DESCRIPTION: Places a orange circle of radius 18 at center (109, 183).
; PLAN: r0=109(x), r1=183(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 183
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
