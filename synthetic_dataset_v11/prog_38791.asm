; DESCRIPTION: Places a orange circle of radius 29 at center (52, 227).
; PLAN: r0=52(x), r1=227(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 227
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
