; DESCRIPTION: Sets a single magenta pixel at (430, 70).
; PLAN: r0=430(x), r1=70(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 70
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
