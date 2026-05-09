; DESCRIPTION: Sets a single purple pixel at (369, 144).
; PLAN: r0=369(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 369
LDI r1, 144
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
