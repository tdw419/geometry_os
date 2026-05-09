; DESCRIPTION: Renders a purple disk with center (352, 139) and radius 62.
; PLAN: r0=352(x), r1=139(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 139
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
