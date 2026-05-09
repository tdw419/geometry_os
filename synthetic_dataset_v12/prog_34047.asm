; DESCRIPTION: Sets a single magenta pixel at (370, 28).
; PLAN: r0=370(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 370
LDI r1, 28
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
