; DESCRIPTION: Sets a single purple pixel at (187, 112).
; PLAN: r0=187(x), r1=112(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 112
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
