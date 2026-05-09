; DESCRIPTION: Sets a single purple pixel at (182, 38).
; PLAN: r0=182(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 38
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
