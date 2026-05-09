; DESCRIPTION: Places a purple circle of radius 66 at center (185, 183).
; PLAN: r0=185(x), r1=183(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 183
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
