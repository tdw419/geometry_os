; DESCRIPTION: Sets a single purple pixel at (246, 153).
; PLAN: r0=246(x), r1=153(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 153
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
