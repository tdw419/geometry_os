; DESCRIPTION: Sets a single green pixel at (490, 171).
; PLAN: r0=490(x), r1=171(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 490
LDI r1, 171
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
