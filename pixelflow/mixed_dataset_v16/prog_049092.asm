; DESCRIPTION: Sets a single yellow pixel at (44, 27).
; PLAN: r0=44(x), r1=27(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 27
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
