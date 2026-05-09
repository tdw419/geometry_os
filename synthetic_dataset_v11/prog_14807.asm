; DESCRIPTION: Places a orange circle of radius 42 at center (203, 175).
; PLAN: r0=203(x), r1=175(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 175
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
