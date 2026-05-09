; DESCRIPTION: Places a purple circle of radius 41 at center (62, 94).
; PLAN: r0=62(x), r1=94(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 94
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
