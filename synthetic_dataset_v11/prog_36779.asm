; DESCRIPTION: Sets a single magenta pixel at (200, 135).
; PLAN: r0=200(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
