; DESCRIPTION: Places a orange circle of radius 31 at center (206, 105).
; PLAN: r0=206(x), r1=105(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 105
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
