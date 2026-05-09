; DESCRIPTION: Sets a single magenta pixel at (52, 139).
; PLAN: r0=52(x), r1=139(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 139
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
