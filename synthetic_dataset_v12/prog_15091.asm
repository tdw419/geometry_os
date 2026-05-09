; DESCRIPTION: Sets a single yellow pixel at (230, 172).
; PLAN: r0=230(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 172
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
