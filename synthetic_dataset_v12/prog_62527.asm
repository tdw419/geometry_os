; DESCRIPTION: Sets a single purple pixel at (430, 103).
; PLAN: r0=430(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
