; DESCRIPTION: Places a orange circle of radius 71 at center (323, 175).
; PLAN: r0=323(x), r1=175(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 175
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
