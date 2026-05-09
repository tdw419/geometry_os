; DESCRIPTION: Places a purple circle of radius 70 at center (99, 149).
; PLAN: r0=99(x), r1=149(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 149
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
