; DESCRIPTION: Sets a single purple pixel at (80, 138).
; PLAN: r0=80(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 138
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
