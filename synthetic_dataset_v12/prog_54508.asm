; DESCRIPTION: Sets a single magenta pixel at (182, 220).
; PLAN: r0=182(x), r1=220(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 220
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
