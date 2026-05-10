; DESCRIPTION: Places a orange circle of radius 17 at center (456, 43).
; PLAN: r0=456(x), r1=43(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 43
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
