; DESCRIPTION: Places a orange circle of radius 52 at center (142, 97).
; PLAN: r0=142(x), r1=97(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 97
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
