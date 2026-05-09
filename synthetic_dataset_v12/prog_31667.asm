; DESCRIPTION: Sets a single yellow pixel at (374, 106).
; PLAN: r0=374(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 374
LDI r1, 106
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
