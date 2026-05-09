; DESCRIPTION: Places a orange circle of radius 78 at center (119, 86).
; PLAN: r0=119(x), r1=86(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 86
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
