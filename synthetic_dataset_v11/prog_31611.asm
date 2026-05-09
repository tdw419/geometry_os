; DESCRIPTION: Places a yellow circle of radius 53 at center (170, 119).
; PLAN: r0=170(x), r1=119(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 119
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
