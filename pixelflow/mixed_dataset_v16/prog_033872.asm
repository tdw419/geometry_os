; DESCRIPTION: Places a purple disk with center (176, 182) and radius 65.
; PLAN: r0=176(x), r1=182(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 182
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
