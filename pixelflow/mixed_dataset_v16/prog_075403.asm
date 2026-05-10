; DESCRIPTION: Places a yellow circle of radius 34 at center (250, 34).
; PLAN: r0=250(x), r1=34(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 34
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
