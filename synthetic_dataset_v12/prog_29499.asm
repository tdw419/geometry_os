; DESCRIPTION: Places a orange circle of radius 67 at center (443, 102).
; PLAN: r0=443(x), r1=102(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 102
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
