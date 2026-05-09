; DESCRIPTION: Places a orange circle of radius 20 at center (110, 122).
; PLAN: r0=110(x), r1=122(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 122
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
