; DESCRIPTION: Renders a blue disk with center (339, 203) and radius 35.
; PLAN: r0=339(x), r1=203(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 203
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
