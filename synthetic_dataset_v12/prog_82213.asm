; DESCRIPTION: Renders a purple disk with center (144, 60) and radius 56.
; PLAN: r0=144(x), r1=60(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 60
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
