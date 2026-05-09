; DESCRIPTION: Places a orange circle of radius 72 at center (140, 101).
; PLAN: r0=140(x), r1=101(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 101
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
