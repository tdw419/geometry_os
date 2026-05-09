; DESCRIPTION: Places a orange circle of radius 30 at center (142, 159).
; PLAN: r0=142(x), r1=159(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 159
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
