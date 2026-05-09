; DESCRIPTION: Places a purple circle of radius 57 at center (292, 72).
; PLAN: r0=292(x), r1=72(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 72
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
