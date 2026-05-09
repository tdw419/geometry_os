; DESCRIPTION: Places a purple circle of radius 40 at center (66, 131).
; PLAN: r0=66(x), r1=131(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 131
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
