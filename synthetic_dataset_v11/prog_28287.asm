; DESCRIPTION: Places a orange circle of radius 29 at center (119, 107).
; PLAN: r0=119(x), r1=107(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 107
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
