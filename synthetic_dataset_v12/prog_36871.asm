; DESCRIPTION: Sets a single magenta pixel at (119, 254).
; PLAN: r0=119(x), r1=254(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 254
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
