; DESCRIPTION: Sets a single magenta pixel at (79, 136).
; PLAN: r0=79(x), r1=136(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 136
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
