; DESCRIPTION: Sets a single purple pixel at (345, 141).
; PLAN: r0=345(x), r1=141(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 141
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
