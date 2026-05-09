; DESCRIPTION: Sets a single purple pixel at (447, 29).
; PLAN: r0=447(x), r1=29(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 447
LDI r1, 29
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
