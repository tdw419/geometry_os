; DESCRIPTION: Places a orange circle of radius 57 at center (439, 77).
; PLAN: r0=439(x), r1=77(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 77
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
