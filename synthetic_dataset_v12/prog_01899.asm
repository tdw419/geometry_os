; DESCRIPTION: Sets a single magenta pixel at (102, 44).
; PLAN: r0=102(x), r1=44(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 44
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
