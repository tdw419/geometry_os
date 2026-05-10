; DESCRIPTION: Sets a single purple pixel at (162, 85).
; PLAN: r0=162(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
