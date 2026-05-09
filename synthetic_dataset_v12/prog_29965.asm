; DESCRIPTION: Renders a blue disk with center (395, 67) and radius 66.
; PLAN: r0=395(x), r1=67(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 67
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
