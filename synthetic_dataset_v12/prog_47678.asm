; DESCRIPTION: Places a purple circle of radius 71 at center (250, 144).
; PLAN: r0=250(x), r1=144(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 144
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
