; DESCRIPTION: Sets a single purple pixel at (264, 214).
; PLAN: r0=264(x), r1=214(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 264
LDI r1, 214
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
