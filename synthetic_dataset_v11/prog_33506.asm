; DESCRIPTION: Places a orange circle of radius 54 at center (120, 86).
; PLAN: r0=120(x), r1=86(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 86
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
