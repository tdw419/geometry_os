; DESCRIPTION: Renders a purple disk with center (117, 222) and radius 17.
; PLAN: r0=117(x), r1=222(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 222
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
