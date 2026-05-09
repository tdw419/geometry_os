; DESCRIPTION: Sets a single magenta pixel at (144, 57).
; PLAN: r0=144(x), r1=57(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 57
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
