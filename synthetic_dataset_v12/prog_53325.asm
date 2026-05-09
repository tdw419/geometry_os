; DESCRIPTION: Places a blue circle of radius 38 at center (238, 66).
; PLAN: r0=238(x), r1=66(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 66
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
