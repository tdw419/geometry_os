; DESCRIPTION: Renders a purple disk with center (67, 192) and radius 14.
; PLAN: r0=67(x), r1=192(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 192
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
