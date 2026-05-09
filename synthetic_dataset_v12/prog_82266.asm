; DESCRIPTION: Sets a single magenta pixel at (321, 189).
; PLAN: r0=321(x), r1=189(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 321
LDI r1, 189
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
