; DESCRIPTION: Places a purple circle of radius 25 at center (153, 140).
; PLAN: r0=153(x), r1=140(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 140
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
