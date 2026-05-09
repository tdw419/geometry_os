; DESCRIPTION: Places a orange circle of radius 59 at center (217, 63).
; PLAN: r0=217(x), r1=63(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 63
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
