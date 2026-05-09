; DESCRIPTION: Places a yellow circle of radius 29 at center (67, 180).
; PLAN: r0=67(x), r1=180(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 180
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
