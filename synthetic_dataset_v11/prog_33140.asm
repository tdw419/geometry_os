; DESCRIPTION: Sets a single magenta pixel at (80, 66).
; PLAN: r0=80(x), r1=66(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 66
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
