; DESCRIPTION: Places a blue circle of radius 66 at center (306, 96).
; PLAN: r0=306(x), r1=96(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 96
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
