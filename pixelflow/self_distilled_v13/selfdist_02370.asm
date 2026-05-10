; DESCRIPTION: Sets a single purple pixel at (223, 183).
; PLAN: r0=223(x), r1=183(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 183
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
