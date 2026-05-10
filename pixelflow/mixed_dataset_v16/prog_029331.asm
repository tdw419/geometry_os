; DESCRIPTION: Sets a single magenta pixel at (19, 131).
; PLAN: r0=19(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
