; DESCRIPTION: Places a purple circle of radius 59 at center (185, 141).
; PLAN: r0=185(x), r1=141(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 141
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
