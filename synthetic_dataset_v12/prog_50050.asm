; DESCRIPTION: Sets a single yellow pixel at (41, 148).
; PLAN: r0=41(x), r1=148(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 148
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
