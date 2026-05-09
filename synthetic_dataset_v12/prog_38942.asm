; DESCRIPTION: Sets a single purple pixel at (117, 88).
; PLAN: r0=117(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 88
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
