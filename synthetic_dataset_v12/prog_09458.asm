; DESCRIPTION: Sets a single magenta pixel at (57, 87).
; PLAN: r0=57(x), r1=87(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 87
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
