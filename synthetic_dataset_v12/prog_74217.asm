; DESCRIPTION: Places a orange circle of radius 60 at center (72, 119).
; PLAN: r0=72(x), r1=119(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 119
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
