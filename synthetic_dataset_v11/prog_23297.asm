; DESCRIPTION: Sets a single purple pixel at (89, 229).
; PLAN: r0=89(x), r1=229(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 229
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
