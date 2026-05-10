; DESCRIPTION: Places a yellow circle of radius 29 at center (462, 84).
; PLAN: r0=462(x), r1=84(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 84
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
