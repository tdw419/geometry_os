; DESCRIPTION: Sets a single purple pixel at (290, 37).
; PLAN: r0=290(x), r1=37(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 290
LDI r1, 37
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
