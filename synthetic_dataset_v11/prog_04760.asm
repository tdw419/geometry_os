; DESCRIPTION: Places a purple circle of radius 19 at center (96, 71).
; PLAN: r0=96(x), r1=71(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 71
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
