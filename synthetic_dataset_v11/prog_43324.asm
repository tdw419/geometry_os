; DESCRIPTION: Places a orange circle of radius 59 at center (176, 61).
; PLAN: r0=176(x), r1=61(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 61
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
