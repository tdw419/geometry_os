; DESCRIPTION: Sets a single blue pixel at (144, 236).
; PLAN: r0=144(x), r1=236(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 236
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
