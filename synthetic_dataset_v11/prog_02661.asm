; DESCRIPTION: Sets a single purple pixel at (157, 89).
; PLAN: r0=157(x), r1=89(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 157
LDI r1, 89
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
