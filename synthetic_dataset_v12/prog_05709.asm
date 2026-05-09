; DESCRIPTION: Sets a single purple pixel at (472, 40).
; PLAN: r0=472(x), r1=40(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 472
LDI r1, 40
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
