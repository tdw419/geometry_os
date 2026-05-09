; DESCRIPTION: Sets a single magenta pixel at (162, 168).
; PLAN: r0=162(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 168
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
