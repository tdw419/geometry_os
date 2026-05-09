; DESCRIPTION: Places a purple circle of radius 25 at center (389, 106).
; PLAN: r0=389(x), r1=106(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 106
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
