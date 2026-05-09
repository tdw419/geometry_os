; DESCRIPTION: Places a orange circle of radius 33 at center (227, 55).
; PLAN: r0=227(x), r1=55(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 55
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
