; DESCRIPTION: Sets a single blue pixel at (242, 85).
; PLAN: r0=242(x), r1=85(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 85
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
