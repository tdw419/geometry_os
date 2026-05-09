; DESCRIPTION: Sets a single yellow pixel at (307, 99).
; PLAN: r0=307(x), r1=99(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 307
LDI r1, 99
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
