; DESCRIPTION: Sets a single magenta pixel at (58, 180).
; PLAN: r0=58(x), r1=180(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 180
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
