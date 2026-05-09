; DESCRIPTION: Sets a single purple pixel at (137, 160).
; PLAN: r0=137(x), r1=160(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 160
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
