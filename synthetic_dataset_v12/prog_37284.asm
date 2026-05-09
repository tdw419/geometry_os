; DESCRIPTION: Places a purple circle of radius 18 at center (292, 163).
; PLAN: r0=292(x), r1=163(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 163
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
