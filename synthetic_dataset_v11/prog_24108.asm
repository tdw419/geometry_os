; DESCRIPTION: Sets a single magenta pixel at (83, 203).
; PLAN: r0=83(x), r1=203(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 203
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
