; DESCRIPTION: Sets a single magenta pixel at (287, 99).
; PLAN: r0=287(x), r1=99(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 99
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
