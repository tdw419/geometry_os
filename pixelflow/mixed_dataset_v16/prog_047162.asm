; DESCRIPTION: Renders a purple disk with center (261, 132) and radius 80.
; PLAN: r0=261(x), r1=132(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 132
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
