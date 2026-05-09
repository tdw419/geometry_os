; DESCRIPTION: Places a orange circle of radius 67 at center (82, 72).
; PLAN: r0=82(x), r1=72(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 72
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
