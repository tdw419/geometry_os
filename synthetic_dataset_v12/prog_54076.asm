; DESCRIPTION: Renders a black disk with center (198, 155) and radius 67.
; PLAN: r0=198(x), r1=155(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 155
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
