; DESCRIPTION: Sets a single purple pixel at (142, 69).
; PLAN: r0=142(x), r1=69(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 69
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
