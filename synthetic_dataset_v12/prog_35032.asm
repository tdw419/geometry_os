; DESCRIPTION: Sets a single magenta pixel at (390, 243).
; PLAN: r0=390(x), r1=243(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 390
LDI r1, 243
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
