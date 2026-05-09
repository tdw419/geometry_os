; DESCRIPTION: Places a orange circle of radius 22 at center (77, 233).
; PLAN: r0=77(x), r1=233(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 233
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
