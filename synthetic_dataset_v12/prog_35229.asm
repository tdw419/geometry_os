; DESCRIPTION: Sets a single magenta pixel at (481, 159).
; PLAN: r0=481(x), r1=159(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 481
LDI r1, 159
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
