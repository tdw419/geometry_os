; DESCRIPTION: Sets a single purple pixel at (364, 39).
; PLAN: r0=364(x), r1=39(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 364
LDI r1, 39
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
