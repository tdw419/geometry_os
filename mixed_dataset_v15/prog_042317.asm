; DESCRIPTION: Places a orange disk with center (78, 29) and radius 50.
; PLAN: r0=78(x), r1=29(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 29
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
