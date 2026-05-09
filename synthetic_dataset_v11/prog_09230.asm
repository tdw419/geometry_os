; DESCRIPTION: Places a purple circle of radius 38 at center (93, 209).
; PLAN: r0=93(x), r1=209(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 209
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
