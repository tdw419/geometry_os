; DESCRIPTION: Places a orange circle of radius 76 at center (77, 89).
; PLAN: r0=77(x), r1=89(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 89
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
