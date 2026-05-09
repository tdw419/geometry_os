; DESCRIPTION: Places a yellow circle of radius 41 at center (201, 71).
; PLAN: r0=201(x), r1=71(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 71
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
