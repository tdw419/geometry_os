; DESCRIPTION: Places a orange circle of radius 37 at center (281, 62).
; PLAN: r0=281(x), r1=62(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 62
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
