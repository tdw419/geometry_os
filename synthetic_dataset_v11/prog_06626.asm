; DESCRIPTION: Sets a single purple pixel at (213, 237).
; PLAN: r0=213(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
