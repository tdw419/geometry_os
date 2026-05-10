; DESCRIPTION: Places a purple disk with center (335, 114) and radius 74.
; PLAN: r0=335(x), r1=114(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 114
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
