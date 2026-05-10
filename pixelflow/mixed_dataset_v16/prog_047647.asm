; DESCRIPTION: Sets a single magenta pixel at (121, 130).
; PLAN: r0=121(x), r1=130(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 130
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
