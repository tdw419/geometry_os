; DESCRIPTION: Sets a single blue pixel at (158, 54).
; PLAN: r0=158(x), r1=54(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 54
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
