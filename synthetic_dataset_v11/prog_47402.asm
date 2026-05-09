; DESCRIPTION: Places a purple circle of radius 53 at center (95, 122).
; PLAN: r0=95(x), r1=122(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 122
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
