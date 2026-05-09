; DESCRIPTION: Places a orange circle of radius 30 at center (85, 176).
; PLAN: r0=85(x), r1=176(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 176
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
