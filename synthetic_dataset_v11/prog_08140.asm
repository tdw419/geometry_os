; DESCRIPTION: Places a orange circle of radius 58 at center (161, 83).
; PLAN: r0=161(x), r1=83(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 83
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
