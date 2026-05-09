; DESCRIPTION: Places a red circle of radius 12 at center (223, 67).
; PLAN: r0=223(x), r1=67(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 67
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
