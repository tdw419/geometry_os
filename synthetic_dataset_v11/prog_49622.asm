; DESCRIPTION: Sets a single magenta pixel at (3, 121).
; PLAN: r0=3(x), r1=121(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 121
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
