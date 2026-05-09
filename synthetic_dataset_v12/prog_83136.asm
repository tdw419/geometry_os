; DESCRIPTION: Places a purple circle of radius 71 at center (251, 84).
; PLAN: r0=251(x), r1=84(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 84
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
