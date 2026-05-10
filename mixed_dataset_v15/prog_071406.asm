; DESCRIPTION: Places a orange disk with center (290, 110) and radius 13.
; PLAN: r0=290(x), r1=110(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 110
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
