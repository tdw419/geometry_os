; DESCRIPTION: Places a purple circle of radius 21 at center (41, 109).
; PLAN: r0=41(x), r1=109(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 109
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
