; DESCRIPTION: Places a purple circle of radius 78 at center (232, 122).
; PLAN: r0=232(x), r1=122(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 122
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
