; DESCRIPTION: Sets a single magenta pixel at (312, 45).
; PLAN: r0=312(x), r1=45(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 312
LDI r1, 45
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
