; DESCRIPTION: Places a blue dot at position (166, 41).
; PLAN: r0=166(x), r1=41(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 41
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
