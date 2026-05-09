; DESCRIPTION: Sets a single yellow pixel at (179, 4).
; PLAN: r0=179(x), r1=4(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 4
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
