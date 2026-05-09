; DESCRIPTION: Renders a purple disk with center (313, 139) and radius 74.
; PLAN: r0=313(x), r1=139(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 139
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
