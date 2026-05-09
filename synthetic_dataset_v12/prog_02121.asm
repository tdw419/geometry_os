; DESCRIPTION: Places a purple circle of radius 73 at center (313, 144).
; PLAN: r0=313(x), r1=144(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 144
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
