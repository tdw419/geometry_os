; DESCRIPTION: Places a blue circle of radius 51 at center (407, 99).
; PLAN: r0=407(x), r1=99(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 99
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
