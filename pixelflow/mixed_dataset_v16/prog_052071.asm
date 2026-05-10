; DESCRIPTION: Places a orange circle of radius 61 at center (117, 116).
; PLAN: r0=117(x), r1=116(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 116
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
