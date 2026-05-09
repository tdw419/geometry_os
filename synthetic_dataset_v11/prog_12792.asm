; DESCRIPTION: Renders a black disk with center (220, 67) and radius 29.
; PLAN: r0=220(x), r1=67(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 67
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
