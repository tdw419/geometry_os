; DESCRIPTION: Sets a single yellow pixel at (20, 17).
; PLAN: r0=20(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 17
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
