; DESCRIPTION: Places a purple circle of radius 57 at center (141, 175).
; PLAN: r0=141(x), r1=175(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 175
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
