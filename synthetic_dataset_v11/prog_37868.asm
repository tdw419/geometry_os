; DESCRIPTION: Places a orange circle of radius 55 at center (69, 118).
; PLAN: r0=69(x), r1=118(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 118
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
