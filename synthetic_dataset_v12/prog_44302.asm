; DESCRIPTION: Renders a purple disk with center (122, 120) and radius 29.
; PLAN: r0=122(x), r1=120(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 120
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
