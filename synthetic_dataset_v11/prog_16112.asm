; DESCRIPTION: Sets a single purple pixel at (18, 129).
; PLAN: r0=18(x), r1=129(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 129
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
