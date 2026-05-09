; DESCRIPTION: Sets a single purple pixel at (307, 196).
; PLAN: r0=307(x), r1=196(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 307
LDI r1, 196
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
