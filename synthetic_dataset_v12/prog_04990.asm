; DESCRIPTION: Sets a single yellow pixel at (362, 140).
; PLAN: r0=362(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
