; DESCRIPTION: Places a blue circle of radius 67 at center (117, 80).
; PLAN: r0=117(x), r1=80(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 80
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
