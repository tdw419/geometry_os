; DESCRIPTION: Places a yellow circle of radius 18 at center (152, 163).
; PLAN: r0=152(x), r1=163(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 163
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
