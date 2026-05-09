; DESCRIPTION: Renders a purple disk with center (84, 128) and radius 76.
; PLAN: r0=84(x), r1=128(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 128
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
