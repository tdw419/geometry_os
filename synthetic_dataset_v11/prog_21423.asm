; DESCRIPTION: Places a yellow circle of radius 72 at center (145, 110).
; PLAN: r0=145(x), r1=110(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 110
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
