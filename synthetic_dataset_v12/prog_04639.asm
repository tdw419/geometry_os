; DESCRIPTION: Sets a single magenta pixel at (18, 176).
; PLAN: r0=18(x), r1=176(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 176
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
