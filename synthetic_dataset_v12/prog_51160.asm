; DESCRIPTION: Places a red circle of radius 51 at center (412, 72).
; PLAN: r0=412(x), r1=72(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 72
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
