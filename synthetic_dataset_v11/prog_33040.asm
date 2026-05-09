; DESCRIPTION: Places a yellow circle of radius 68 at center (89, 119).
; PLAN: r0=89(x), r1=119(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 119
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
