; DESCRIPTION: Sets a single magenta pixel at (463, 137).
; PLAN: r0=463(x), r1=137(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 137
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
