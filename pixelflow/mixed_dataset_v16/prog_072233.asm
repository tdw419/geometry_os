; DESCRIPTION: Places a yellow circle of radius 80 at center (390, 156).
; PLAN: r0=390(x), r1=156(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 156
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
