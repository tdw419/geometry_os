; DESCRIPTION: Sets a single blue pixel at (111, 41).
; PLAN: r0=111(x), r1=41(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 41
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
