; DESCRIPTION: Renders a purple disk with center (84, 186) and radius 35.
; PLAN: r0=84(x), r1=186(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 186
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
