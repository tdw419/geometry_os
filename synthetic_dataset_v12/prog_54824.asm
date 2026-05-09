; DESCRIPTION: Sets a single magenta pixel at (424, 84).
; PLAN: r0=424(x), r1=84(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 84
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
