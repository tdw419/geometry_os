; DESCRIPTION: Sets a single magenta pixel at (120, 147).
; PLAN: r0=120(x), r1=147(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 147
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
