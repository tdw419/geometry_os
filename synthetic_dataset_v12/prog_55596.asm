; DESCRIPTION: Sets a single purple pixel at (186, 234).
; PLAN: r0=186(x), r1=234(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 234
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
