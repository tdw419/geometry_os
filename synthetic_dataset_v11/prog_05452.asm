; DESCRIPTION: Sets a single yellow pixel at (194, 243).
; PLAN: r0=194(x), r1=243(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 243
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
