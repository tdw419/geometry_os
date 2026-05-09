; DESCRIPTION: Sets a single magenta pixel at (209, 100).
; PLAN: r0=209(x), r1=100(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 100
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
