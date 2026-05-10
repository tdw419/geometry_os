; DESCRIPTION: Places a purple circle of radius 39 at center (115, 153).
; PLAN: r0=115(x), r1=153(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 153
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
