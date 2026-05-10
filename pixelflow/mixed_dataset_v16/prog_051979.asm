; DESCRIPTION: Sets a single magenta pixel at (23, 251).
; PLAN: r0=23(x), r1=251(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 251
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
