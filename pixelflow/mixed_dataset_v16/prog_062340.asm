; DESCRIPTION: Sets a single purple pixel at (16, 202).
; PLAN: r0=16(x), r1=202(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 202
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
