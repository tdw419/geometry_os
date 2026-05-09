; DESCRIPTION: Sets a single magenta pixel at (131, 226).
; PLAN: r0=131(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 226
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
