; DESCRIPTION: Sets a single yellow pixel at (101, 247).
; PLAN: r0=101(x), r1=247(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 247
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
