; DESCRIPTION: Places a yellow circle of radius 80 at center (250, 88).
; PLAN: r0=250(x), r1=88(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 88
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
