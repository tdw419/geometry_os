; DESCRIPTION: Sets a single magenta pixel at (185, 109).
; PLAN: r0=185(x), r1=109(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 109
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
