; DESCRIPTION: Sets a single purple pixel at (242, 72).
; PLAN: r0=242(x), r1=72(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 72
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
