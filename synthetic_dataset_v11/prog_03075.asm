; DESCRIPTION: Sets a single purple pixel at (247, 159).
; PLAN: r0=247(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 159
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
