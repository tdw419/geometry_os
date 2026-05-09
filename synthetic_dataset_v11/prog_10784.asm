; DESCRIPTION: Places a orange circle of radius 21 at center (43, 185).
; PLAN: r0=43(x), r1=185(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 185
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
