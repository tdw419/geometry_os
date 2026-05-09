; DESCRIPTION: Sets a single magenta pixel at (431, 108).
; PLAN: r0=431(x), r1=108(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 431
LDI r1, 108
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
