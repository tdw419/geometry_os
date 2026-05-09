; DESCRIPTION: Sets a single magenta pixel at (400, 96).
; PLAN: r0=400(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
