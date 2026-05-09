; DESCRIPTION: Sets a single yellow pixel at (369, 82).
; PLAN: r0=369(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 369
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
