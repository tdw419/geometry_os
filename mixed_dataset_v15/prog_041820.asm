; DESCRIPTION: Sets a single cyan pixel at (125, 41).
; PLAN: r0=125(x), r1=41(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 41
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
