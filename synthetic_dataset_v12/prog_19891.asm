; DESCRIPTION: Places a orange circle of radius 58 at center (315, 67).
; PLAN: r0=315(x), r1=67(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 67
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
