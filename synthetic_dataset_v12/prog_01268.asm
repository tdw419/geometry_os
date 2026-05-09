; DESCRIPTION: Places a blue circle of radius 18 at center (51, 34).
; PLAN: r0=51(x), r1=34(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 34
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
