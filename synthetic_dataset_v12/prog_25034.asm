; DESCRIPTION: Places a orange circle of radius 52 at center (156, 152).
; PLAN: r0=156(x), r1=152(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 152
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
