; DESCRIPTION: Sets a single magenta pixel at (160, 160).
; PLAN: r0=160(x), r1=160(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 160
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
