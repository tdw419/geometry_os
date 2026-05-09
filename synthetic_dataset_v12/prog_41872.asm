; DESCRIPTION: Sets a single magenta pixel at (448, 136).
; PLAN: r0=448(x), r1=136(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 136
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
