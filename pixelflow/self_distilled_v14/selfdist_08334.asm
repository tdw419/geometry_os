; DESCRIPTION: Places a red disk with center (163, 110) and radius 53.
; PLAN: r0=163(x), r1=110(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 110
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
