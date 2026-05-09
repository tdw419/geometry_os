; DESCRIPTION: Sets a single purple pixel at (281, 41).
; PLAN: r0=281(x), r1=41(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 281
LDI r1, 41
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
