; DESCRIPTION: Sets a single purple pixel at (86, 109).
; PLAN: r0=86(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
