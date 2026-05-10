; DESCRIPTION: Sets a single magenta pixel at (28, 37).
; PLAN: r0=28(x), r1=37(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 37
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
