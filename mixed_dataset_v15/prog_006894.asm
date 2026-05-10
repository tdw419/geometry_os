; DESCRIPTION: Sets a single magenta pixel at (382, 74).
; PLAN: r0=382(x), r1=74(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 382
LDI r1, 74
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
