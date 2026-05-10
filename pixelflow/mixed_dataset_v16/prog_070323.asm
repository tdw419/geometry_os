; DESCRIPTION: Places a yellow circle of radius 51 at center (120, 199).
; PLAN: r0=120(x), r1=199(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 199
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
