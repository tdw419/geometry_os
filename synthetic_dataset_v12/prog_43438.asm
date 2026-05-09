; DESCRIPTION: Renders a purple disk with center (203, 98) and radius 71.
; PLAN: r0=203(x), r1=98(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 98
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
