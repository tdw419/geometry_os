; DESCRIPTION: Places a purple circle of radius 26 at center (455, 106).
; PLAN: r0=455(x), r1=106(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 106
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
