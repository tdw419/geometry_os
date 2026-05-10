; DESCRIPTION: Sets a single blue pixel at (121, 104).
; PLAN: r0=121(x), r1=104(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 104
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
