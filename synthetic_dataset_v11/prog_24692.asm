; DESCRIPTION: Places a yellow circle of radius 22 at center (155, 115).
; PLAN: r0=155(x), r1=115(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 115
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
