; DESCRIPTION: Sets a single purple pixel at (41, 221).
; PLAN: r0=41(x), r1=221(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 221
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
