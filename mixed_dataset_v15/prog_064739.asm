; DESCRIPTION: Places a purple circle of radius 29 at center (37, 167).
; PLAN: r0=37(x), r1=167(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 167
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
