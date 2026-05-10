; DESCRIPTION: Sets a single magenta pixel at (379, 18).
; PLAN: r0=379(x), r1=18(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 379
LDI r1, 18
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
