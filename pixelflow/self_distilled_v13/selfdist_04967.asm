; DESCRIPTION: Sets a single purple pixel at (354, 131).
; PLAN: r0=354(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 131
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
