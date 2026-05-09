; DESCRIPTION: Sets a single purple pixel at (478, 174).
; PLAN: r0=478(x), r1=174(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 478
LDI r1, 174
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
