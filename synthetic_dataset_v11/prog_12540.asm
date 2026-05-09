; DESCRIPTION: Renders a purple disk with center (128, 60) and radius 43.
; PLAN: r0=128(x), r1=60(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 60
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
