; DESCRIPTION: Sets a single purple pixel at (353, 45).
; PLAN: r0=353(x), r1=45(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 45
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
