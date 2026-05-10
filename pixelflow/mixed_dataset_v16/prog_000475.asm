; DESCRIPTION: Places a yellow circle of radius 45 at center (287, 67).
; PLAN: r0=287(x), r1=67(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 67
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
