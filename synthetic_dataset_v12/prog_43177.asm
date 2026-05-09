; DESCRIPTION: Sets a single magenta pixel at (158, 83).
; PLAN: r0=158(x), r1=83(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 83
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
