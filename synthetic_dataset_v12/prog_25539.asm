; DESCRIPTION: Places a yellow circle of radius 51 at center (317, 77).
; PLAN: r0=317(x), r1=77(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 77
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
