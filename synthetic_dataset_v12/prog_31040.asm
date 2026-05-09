; DESCRIPTION: Places a orange circle of radius 21 at center (67, 124).
; PLAN: r0=67(x), r1=124(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 124
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
