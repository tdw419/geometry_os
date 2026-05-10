; DESCRIPTION: Places a purple circle of radius 28 at center (55, 216).
; PLAN: r0=55(x), r1=216(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 216
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
