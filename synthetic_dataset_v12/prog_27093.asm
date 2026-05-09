; DESCRIPTION: Sets a single purple pixel at (298, 120).
; PLAN: r0=298(x), r1=120(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 120
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
