; DESCRIPTION: Places a orange circle of radius 41 at center (162, 93).
; PLAN: r0=162(x), r1=93(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 93
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
