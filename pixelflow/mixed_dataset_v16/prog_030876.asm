; DESCRIPTION: Sets a single purple pixel at (106, 44).
; PLAN: r0=106(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
