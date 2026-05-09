; DESCRIPTION: Sets a single purple pixel at (249, 165).
; PLAN: r0=249(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 165
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
