; DESCRIPTION: Sets a single magenta pixel at (289, 103).
; PLAN: r0=289(x), r1=103(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 289
LDI r1, 103
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
