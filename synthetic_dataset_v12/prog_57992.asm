; DESCRIPTION: Places a purple circle of radius 60 at center (349, 148).
; PLAN: r0=349(x), r1=148(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 148
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
