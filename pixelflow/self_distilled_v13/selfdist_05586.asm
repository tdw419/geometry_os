; DESCRIPTION: Sets a single magenta pixel at (28, 114).
; PLAN: r0=28(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
