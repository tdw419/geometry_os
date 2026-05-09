; DESCRIPTION: Sets a single magenta pixel at (111, 7).
; PLAN: r0=111(x), r1=7(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 7
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
