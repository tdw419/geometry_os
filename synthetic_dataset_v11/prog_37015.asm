; DESCRIPTION: Places a purple circle of radius 71 at center (80, 76).
; PLAN: r0=80(x), r1=76(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 76
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
