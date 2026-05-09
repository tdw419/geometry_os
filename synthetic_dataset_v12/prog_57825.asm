; DESCRIPTION: Sets a single purple pixel at (325, 91).
; PLAN: r0=325(x), r1=91(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 325
LDI r1, 91
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
