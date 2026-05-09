; DESCRIPTION: Sets a single magenta pixel at (130, 110).
; PLAN: r0=130(x), r1=110(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 110
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
