; DESCRIPTION: Places a yellow circle of radius 67 at center (409, 67).
; PLAN: r0=409(x), r1=67(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 67
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
