; DESCRIPTION: Sets a single magenta pixel at (61, 238).
; PLAN: r0=61(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
