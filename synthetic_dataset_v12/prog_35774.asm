; DESCRIPTION: Sets a single purple pixel at (77, 38).
; PLAN: r0=77(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 38
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
