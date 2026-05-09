; DESCRIPTION: Renders a purple disk with center (490, 111) and radius 15.
; PLAN: r0=490(x), r1=111(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 490
LDI r1, 111
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
