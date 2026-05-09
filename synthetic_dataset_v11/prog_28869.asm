; DESCRIPTION: Sets a single purple pixel at (227, 69).
; PLAN: r0=227(x), r1=69(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 69
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
