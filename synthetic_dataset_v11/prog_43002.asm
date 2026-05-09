; DESCRIPTION: Places a purple circle of radius 51 at center (102, 78).
; PLAN: r0=102(x), r1=78(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 78
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
