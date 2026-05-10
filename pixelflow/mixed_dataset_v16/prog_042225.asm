; DESCRIPTION: Sets a single purple pixel at (243, 170).
; PLAN: r0=243(x), r1=170(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 170
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
