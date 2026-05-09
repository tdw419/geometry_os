; DESCRIPTION: Places a purple circle of radius 36 at center (220, 53).
; PLAN: r0=220(x), r1=53(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 53
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
