; DESCRIPTION: Places a yellow circle of radius 15 at center (89, 140).
; PLAN: r0=89(x), r1=140(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 140
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
