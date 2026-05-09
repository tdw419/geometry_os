; DESCRIPTION: Sets a single blue pixel at (116, 153).
; PLAN: r0=116(x), r1=153(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 153
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
