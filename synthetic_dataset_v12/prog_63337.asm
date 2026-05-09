; DESCRIPTION: Sets a single purple pixel at (39, 35).
; PLAN: r0=39(x), r1=35(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 35
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
