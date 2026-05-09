; DESCRIPTION: Places a orange circle of radius 33 at center (87, 56).
; PLAN: r0=87(x), r1=56(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 56
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
