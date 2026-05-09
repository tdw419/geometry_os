; DESCRIPTION: Places a orange circle of radius 68 at center (286, 69).
; PLAN: r0=286(x), r1=69(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 69
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
