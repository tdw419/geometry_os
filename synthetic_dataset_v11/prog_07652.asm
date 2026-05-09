; DESCRIPTION: Places a red circle of radius 41 at center (139, 212).
; PLAN: r0=139(x), r1=212(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 212
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
