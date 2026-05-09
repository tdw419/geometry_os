; DESCRIPTION: Places a orange circle of radius 43 at center (107, 96).
; PLAN: r0=107(x), r1=96(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 96
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
