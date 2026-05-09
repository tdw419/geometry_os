; DESCRIPTION: Places a purple circle of radius 54 at center (149, 149).
; PLAN: r0=149(x), r1=149(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 149
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
