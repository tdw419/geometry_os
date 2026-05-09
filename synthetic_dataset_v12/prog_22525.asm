; DESCRIPTION: Sets a single magenta pixel at (471, 208).
; PLAN: r0=471(x), r1=208(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 471
LDI r1, 208
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
