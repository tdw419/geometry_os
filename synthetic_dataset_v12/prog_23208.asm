; DESCRIPTION: Sets a single magenta pixel at (164, 25).
; PLAN: r0=164(x), r1=25(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 164
LDI r1, 25
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
