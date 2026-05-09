; DESCRIPTION: Renders a blue disk with center (246, 122) and radius 58.
; PLAN: r0=246(x), r1=122(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 122
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
