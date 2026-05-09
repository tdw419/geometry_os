; DESCRIPTION: Places a orange circle of radius 16 at center (156, 78).
; PLAN: r0=156(x), r1=78(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 78
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
