; DESCRIPTION: Sets a single purple pixel at (407, 124).
; PLAN: r0=407(x), r1=124(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 124
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
