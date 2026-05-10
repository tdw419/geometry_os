; DESCRIPTION: Places a yellow disk with center (369, 51) and radius 75.
; PLAN: r0=369(x), r1=51(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 51
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
