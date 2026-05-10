; DESCRIPTION: Renders a black disk with center (241, 104) and radius 67.
; PLAN: r0=241(x), r1=104(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 104
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
