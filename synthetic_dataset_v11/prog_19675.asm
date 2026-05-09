; DESCRIPTION: Places a orange circle of radius 60 at center (137, 157).
; PLAN: r0=137(x), r1=157(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 157
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
