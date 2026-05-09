; DESCRIPTION: Places a orange circle of radius 13 at center (120, 24).
; PLAN: r0=120(x), r1=24(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 24
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
