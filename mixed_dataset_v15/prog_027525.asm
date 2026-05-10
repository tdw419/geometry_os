; DESCRIPTION: Sets a single yellow pixel at (153, 163).
; PLAN: r0=153(x), r1=163(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 163
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
