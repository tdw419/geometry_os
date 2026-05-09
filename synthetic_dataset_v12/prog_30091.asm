; DESCRIPTION: Places a orange circle of radius 39 at center (192, 105).
; PLAN: r0=192(x), r1=105(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 105
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
