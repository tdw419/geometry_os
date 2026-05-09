; DESCRIPTION: Sets a single purple pixel at (120, 181).
; PLAN: r0=120(x), r1=181(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 181
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
