; DESCRIPTION: Sets a single magenta pixel at (24, 73).
; PLAN: r0=24(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 73
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
