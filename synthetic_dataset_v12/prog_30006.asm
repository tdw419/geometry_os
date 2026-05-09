; DESCRIPTION: Renders a blue disk with center (176, 169) and radius 67.
; PLAN: r0=176(x), r1=169(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 169
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
