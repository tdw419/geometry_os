; DESCRIPTION: Sets a single magenta pixel at (292, 53).
; PLAN: r0=292(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 292
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
