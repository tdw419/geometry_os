; DESCRIPTION: Places a orange circle of radius 74 at center (306, 122).
; PLAN: r0=306(x), r1=122(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 122
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
