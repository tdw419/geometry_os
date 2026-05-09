; DESCRIPTION: Sets a single purple pixel at (84, 134).
; PLAN: r0=84(x), r1=134(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 134
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
