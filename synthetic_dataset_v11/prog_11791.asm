; DESCRIPTION: Sets a single purple pixel at (106, 108).
; PLAN: r0=106(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 108
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
