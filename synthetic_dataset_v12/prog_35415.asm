; DESCRIPTION: Renders a purple disk with center (162, 139) and radius 52.
; PLAN: r0=162(x), r1=139(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 139
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
