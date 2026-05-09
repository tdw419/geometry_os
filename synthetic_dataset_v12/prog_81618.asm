; DESCRIPTION: Sets a single magenta pixel at (454, 176).
; PLAN: r0=454(x), r1=176(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 454
LDI r1, 176
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
