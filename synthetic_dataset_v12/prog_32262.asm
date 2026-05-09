; DESCRIPTION: Places a orange circle of radius 61 at center (316, 181).
; PLAN: r0=316(x), r1=181(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 181
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
