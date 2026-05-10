; DESCRIPTION: Places a orange circle of radius 63 at center (373, 97).
; PLAN: r0=373(x), r1=97(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 97
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
