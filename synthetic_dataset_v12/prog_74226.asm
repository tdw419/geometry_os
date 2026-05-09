; DESCRIPTION: Places a orange circle of radius 17 at center (18, 110).
; PLAN: r0=18(x), r1=110(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 110
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
