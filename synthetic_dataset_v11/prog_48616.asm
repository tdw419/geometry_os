; DESCRIPTION: Sets a single magenta pixel at (193, 159).
; PLAN: r0=193(x), r1=159(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 159
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
