; DESCRIPTION: Sets a single magenta pixel at (36, 162).
; PLAN: r0=36(x), r1=162(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 162
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
