; DESCRIPTION: Places a purple circle of radius 25 at center (125, 84).
; PLAN: r0=125(x), r1=84(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 84
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
