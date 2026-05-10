; DESCRIPTION: Sets a single magenta pixel at (137, 56).
; PLAN: r0=137(x), r1=56(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 56
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
