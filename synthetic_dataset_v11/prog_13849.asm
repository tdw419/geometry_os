; DESCRIPTION: Sets a single yellow pixel at (213, 30).
; PLAN: r0=213(x), r1=30(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 30
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
