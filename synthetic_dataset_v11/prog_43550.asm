; DESCRIPTION: Sets a single blue pixel at (27, 53).
; PLAN: r0=27(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 53
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
