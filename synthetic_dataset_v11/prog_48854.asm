; DESCRIPTION: Places a orange circle of radius 19 at center (28, 110).
; PLAN: r0=28(x), r1=110(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 110
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
