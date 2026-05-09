; DESCRIPTION: Sets a single magenta pixel at (22, 94).
; PLAN: r0=22(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 94
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
