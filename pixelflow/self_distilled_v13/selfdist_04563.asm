; DESCRIPTION: Sets a single purple pixel at (258, 160).
; PLAN: r0=258(x), r1=160(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 258
LDI r1, 160
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
