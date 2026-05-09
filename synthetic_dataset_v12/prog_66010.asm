; DESCRIPTION: Sets a single magenta pixel at (66, 178).
; PLAN: r0=66(x), r1=178(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 178
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
