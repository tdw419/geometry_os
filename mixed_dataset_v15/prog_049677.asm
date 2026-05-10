; DESCRIPTION: Sets a single magenta pixel at (352, 58).
; PLAN: r0=352(x), r1=58(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 58
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
