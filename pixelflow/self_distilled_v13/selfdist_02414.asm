; DESCRIPTION: Sets a single purple pixel at (28, 133).
; PLAN: r0=28(x), r1=133(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 133
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
