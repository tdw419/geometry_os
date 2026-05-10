; DESCRIPTION: Sets a single yellow pixel at (75, 59).
; PLAN: r0=75(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
