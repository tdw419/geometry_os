; DESCRIPTION: Places a orange circle of radius 14 at center (342, 121).
; PLAN: r0=342(x), r1=121(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 121
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
