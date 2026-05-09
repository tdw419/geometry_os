; DESCRIPTION: Places a orange circle of radius 75 at center (226, 170).
; PLAN: r0=226(x), r1=170(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 170
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
