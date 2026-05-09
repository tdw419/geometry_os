; DESCRIPTION: Places a blue circle of radius 67 at center (108, 114).
; PLAN: r0=108(x), r1=114(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 114
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
