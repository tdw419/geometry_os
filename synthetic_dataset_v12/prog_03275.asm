; DESCRIPTION: Places a purple circle of radius 26 at center (80, 156).
; PLAN: r0=80(x), r1=156(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 156
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
