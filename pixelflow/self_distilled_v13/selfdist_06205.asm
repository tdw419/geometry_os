; DESCRIPTION: Places a blue disk with center (246, 139) and radius 49.
; PLAN: r0=246(x), r1=139(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 139
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
