; DESCRIPTION: Places a purple circle of radius 68 at center (131, 84).
; PLAN: r0=131(x), r1=84(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 84
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
