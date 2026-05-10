; DESCRIPTION: Sets a single purple pixel at (44, 135).
; PLAN: r0=44(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 135
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
