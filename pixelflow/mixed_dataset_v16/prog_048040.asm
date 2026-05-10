; DESCRIPTION: Sets a single magenta pixel at (339, 5).
; PLAN: r0=339(x), r1=5(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 339
LDI r1, 5
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
