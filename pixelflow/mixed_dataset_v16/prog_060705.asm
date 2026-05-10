; DESCRIPTION: Sets a single blue pixel at (460, 179).
; PLAN: r0=460(x), r1=179(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 179
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
