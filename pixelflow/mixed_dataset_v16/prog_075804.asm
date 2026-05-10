; DESCRIPTION: Sets a single purple pixel at (488, 102).
; PLAN: r0=488(x), r1=102(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 488
LDI r1, 102
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
