; DESCRIPTION: Places a orange circle of radius 57 at center (236, 84).
; PLAN: r0=236(x), r1=84(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 84
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
