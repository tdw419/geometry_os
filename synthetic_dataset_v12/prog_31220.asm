; DESCRIPTION: Places a orange circle of radius 76 at center (192, 149).
; PLAN: r0=192(x), r1=149(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 149
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
