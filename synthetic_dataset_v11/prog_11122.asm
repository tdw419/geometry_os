; DESCRIPTION: Places a yellow circle of radius 72 at center (138, 100).
; PLAN: r0=138(x), r1=100(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 100
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
