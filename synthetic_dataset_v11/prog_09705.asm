; DESCRIPTION: Sets a single magenta pixel at (136, 163).
; PLAN: r0=136(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
