; DESCRIPTION: Sets a single yellow pixel at (434, 170).
; PLAN: r0=434(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 434
LDI r1, 170
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
