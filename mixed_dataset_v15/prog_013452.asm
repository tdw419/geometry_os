; DESCRIPTION: Renders a purple disk with center (196, 216) and radius 12.
; PLAN: r0=196(x), r1=216(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 216
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
