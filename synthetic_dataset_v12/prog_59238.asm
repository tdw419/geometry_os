; DESCRIPTION: Sets a single purple pixel at (212, 136).
; PLAN: r0=212(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
