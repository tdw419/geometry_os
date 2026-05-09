; DESCRIPTION: Sets a single magenta pixel at (81, 137).
; PLAN: r0=81(x), r1=137(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 137
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
