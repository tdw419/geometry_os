; DESCRIPTION: Places a purple circle of radius 29 at center (185, 157).
; PLAN: r0=185(x), r1=157(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 157
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
