; DESCRIPTION: Places a blue disk with center (238, 182) and radius 31.
; PLAN: r0=238(x), r1=182(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 182
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
