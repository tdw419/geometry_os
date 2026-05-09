; DESCRIPTION: Places a yellow circle of radius 41 at center (311, 105).
; PLAN: r0=311(x), r1=105(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 105
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
