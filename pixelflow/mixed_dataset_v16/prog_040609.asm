; DESCRIPTION: Places a orange circle of radius 71 at center (120, 105).
; PLAN: r0=120(x), r1=105(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 105
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
