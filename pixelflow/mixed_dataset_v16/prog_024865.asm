; DESCRIPTION: Places a purple circle of radius 29 at center (41, 131).
; PLAN: r0=41(x), r1=131(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 131
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
