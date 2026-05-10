; DESCRIPTION: Sets a single purple pixel at (126, 41).
; PLAN: r0=126(x), r1=41(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 41
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
