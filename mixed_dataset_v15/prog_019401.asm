; DESCRIPTION: Places a purple disk with center (40, 182) and radius 76.
; PLAN: r0=40(x), r1=182(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 182
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
