; DESCRIPTION: Renders a purple disk with center (213, 203) and radius 32.
; PLAN: r0=213(x), r1=203(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 203
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
