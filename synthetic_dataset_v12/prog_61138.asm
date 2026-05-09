; DESCRIPTION: Sets a single magenta pixel at (60, 135).
; PLAN: r0=60(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
