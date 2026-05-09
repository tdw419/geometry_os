; DESCRIPTION: Places a white circle of radius 10 at center (390, 68).
; PLAN: r0=390(x), r1=68(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 68
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
