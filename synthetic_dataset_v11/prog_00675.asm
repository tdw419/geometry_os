; DESCRIPTION: Places a purple circle of radius 58 at center (197, 72).
; PLAN: r0=197(x), r1=72(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 72
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
