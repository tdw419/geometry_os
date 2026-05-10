; DESCRIPTION: Places a purple circle of radius 34 at center (76, 180).
; PLAN: r0=76(x), r1=180(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 180
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
