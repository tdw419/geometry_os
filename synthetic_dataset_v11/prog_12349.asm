; DESCRIPTION: Places a orange circle of radius 43 at center (148, 43).
; PLAN: r0=148(x), r1=43(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 43
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
