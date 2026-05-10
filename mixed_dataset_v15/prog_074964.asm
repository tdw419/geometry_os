; DESCRIPTION: Sets a single purple pixel at (150, 58).
; PLAN: r0=150(x), r1=58(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 58
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
