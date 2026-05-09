; DESCRIPTION: Places a purple circle of radius 12 at center (119, 206).
; PLAN: r0=119(x), r1=206(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 206
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
