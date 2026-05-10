; DESCRIPTION: Sets a single purple pixel at (368, 159).
; PLAN: r0=368(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 368
LDI r1, 159
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
