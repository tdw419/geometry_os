; DESCRIPTION: Places a black circle of radius 67 at center (122, 105).
; PLAN: r0=122(x), r1=105(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 105
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
