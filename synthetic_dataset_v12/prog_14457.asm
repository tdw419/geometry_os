; DESCRIPTION: Places a orange circle of radius 62 at center (218, 104).
; PLAN: r0=218(x), r1=104(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 104
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
