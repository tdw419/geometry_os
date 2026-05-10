; DESCRIPTION: Sets a single magenta pixel at (361, 153).
; PLAN: r0=361(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 361
LDI r1, 153
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
