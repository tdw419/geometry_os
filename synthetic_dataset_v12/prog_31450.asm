; DESCRIPTION: Places a orange circle of radius 25 at center (203, 68).
; PLAN: r0=203(x), r1=68(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 68
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
