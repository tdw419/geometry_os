; DESCRIPTION: Places a yellow circle of radius 78 at center (363, 84).
; PLAN: r0=363(x), r1=84(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 84
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
