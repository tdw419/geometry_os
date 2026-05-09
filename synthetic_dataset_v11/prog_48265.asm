; DESCRIPTION: Places a orange circle of radius 21 at center (174, 78).
; PLAN: r0=174(x), r1=78(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 78
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
