; DESCRIPTION: Sets a single yellow pixel at (228, 140).
; PLAN: r0=228(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
