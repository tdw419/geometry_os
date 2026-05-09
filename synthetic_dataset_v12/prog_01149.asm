; DESCRIPTION: Sets a single magenta pixel at (477, 132).
; PLAN: r0=477(x), r1=132(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 477
LDI r1, 132
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
