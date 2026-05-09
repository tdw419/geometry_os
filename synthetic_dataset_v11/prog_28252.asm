; DESCRIPTION: Sets a single magenta pixel at (193, 61).
; PLAN: r0=193(x), r1=61(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 61
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
