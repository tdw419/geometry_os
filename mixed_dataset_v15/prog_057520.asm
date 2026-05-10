; DESCRIPTION: Sets a single magenta pixel at (85, 148).
; PLAN: r0=85(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
