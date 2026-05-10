; DESCRIPTION: Places a orange circle of radius 50 at center (129, 170).
; PLAN: r0=129(x), r1=170(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 170
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
