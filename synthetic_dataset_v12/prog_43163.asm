; DESCRIPTION: Places a orange circle of radius 41 at center (142, 94).
; PLAN: r0=142(x), r1=94(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 94
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
