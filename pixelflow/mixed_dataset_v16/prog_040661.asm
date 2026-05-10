; DESCRIPTION: Sets a single magenta pixel at (11, 181).
; PLAN: r0=11(x), r1=181(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 181
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
