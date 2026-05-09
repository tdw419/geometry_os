; DESCRIPTION: Sets a single purple pixel at (470, 71).
; PLAN: r0=470(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 470
LDI r1, 71
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
