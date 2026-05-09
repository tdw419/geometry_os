; DESCRIPTION: Places a orange circle of radius 11 at center (25, 24).
; PLAN: r0=25(x), r1=24(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 24
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
