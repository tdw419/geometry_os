; DESCRIPTION: Places a orange circle of radius 43 at center (389, 108).
; PLAN: r0=389(x), r1=108(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 108
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
