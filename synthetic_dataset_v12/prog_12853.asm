; DESCRIPTION: Places a purple circle of radius 44 at center (431, 136).
; PLAN: r0=431(x), r1=136(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 136
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
