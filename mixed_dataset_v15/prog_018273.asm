; DESCRIPTION: Places a purple circle of radius 34 at center (414, 157).
; PLAN: r0=414(x), r1=157(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 157
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
