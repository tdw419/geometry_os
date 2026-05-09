; DESCRIPTION: Places a orange circle of radius 80 at center (266, 158).
; PLAN: r0=266(x), r1=158(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 158
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
