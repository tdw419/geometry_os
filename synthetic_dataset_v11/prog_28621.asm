; DESCRIPTION: Places a yellow circle of radius 22 at center (67, 185).
; PLAN: r0=67(x), r1=185(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 185
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
