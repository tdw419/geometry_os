; DESCRIPTION: Places a orange circle of radius 39 at center (361, 78).
; PLAN: r0=361(x), r1=78(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 78
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
