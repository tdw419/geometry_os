; DESCRIPTION: Places a purple circle of radius 47 at center (436, 60).
; PLAN: r0=436(x), r1=60(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 60
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
