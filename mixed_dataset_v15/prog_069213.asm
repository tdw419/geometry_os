; DESCRIPTION: Sets a single magenta pixel at (293, 22).
; PLAN: r0=293(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 293
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
