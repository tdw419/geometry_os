; DESCRIPTION: Places a purple disk with center (139, 12) and radius 57.
; PLAN: r0=139(x), r1=12(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 12
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
