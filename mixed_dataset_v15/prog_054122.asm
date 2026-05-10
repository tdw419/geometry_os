; DESCRIPTION: Places a orange circle of radius 67 at center (311, 99).
; PLAN: r0=311(x), r1=99(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 99
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
