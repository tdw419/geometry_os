; DESCRIPTION: Places a blue circle of radius 17 at center (292, 118).
; PLAN: r0=292(x), r1=118(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 118
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
