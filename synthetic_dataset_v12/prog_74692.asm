; DESCRIPTION: Places a red circle of radius 38 at center (472, 67).
; PLAN: r0=472(x), r1=67(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 472
LDI r1, 67
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
