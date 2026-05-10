; DESCRIPTION: Sets a single purple pixel at (177, 27).
; PLAN: r0=177(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 27
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
