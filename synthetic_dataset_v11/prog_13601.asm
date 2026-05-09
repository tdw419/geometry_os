; DESCRIPTION: Sets a single magenta pixel at (82, 167).
; PLAN: r0=82(x), r1=167(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 167
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
