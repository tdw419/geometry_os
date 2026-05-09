; DESCRIPTION: Places a white circle of radius 14 at center (67, 78).
; PLAN: r0=67(x), r1=78(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 78
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
