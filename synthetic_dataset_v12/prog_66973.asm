; DESCRIPTION: Places a orange circle of radius 24 at center (79, 232).
; PLAN: r0=79(x), r1=232(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 232
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
