; DESCRIPTION: Sets a single blue pixel at (118, 210).
; PLAN: r0=118(x), r1=210(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 210
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
