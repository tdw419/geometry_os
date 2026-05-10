; DESCRIPTION: Sets a single magenta pixel at (334, 126).
; PLAN: r0=334(x), r1=126(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 334
LDI r1, 126
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
