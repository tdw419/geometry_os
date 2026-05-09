; DESCRIPTION: Sets a single purple pixel at (209, 48).
; PLAN: r0=209(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
