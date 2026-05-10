; DESCRIPTION: Places a purple disk with center (29, 67) and radius 61.
; PLAN: r0=29(x), r1=67(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 67
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
