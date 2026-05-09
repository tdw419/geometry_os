; DESCRIPTION: Places a white dot at position (490, 41).
; PLAN: r0=490(x), r1=41(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 490
LDI r1, 41
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
