; DESCRIPTION: Places a purple circle of radius 28 at center (192, 225).
; PLAN: r0=192(x), r1=225(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 225
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
