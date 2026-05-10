; DESCRIPTION: Sets a single yellow pixel at (263, 23).
; PLAN: r0=263(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 263
LDI r1, 23
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
